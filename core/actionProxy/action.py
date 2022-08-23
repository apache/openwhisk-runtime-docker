#! /usr/bin/python

import re
import requests
from bs4 import BeautifulSoup
from requests.auth import HTTPBasicAuth
import os
import shutil
from webdav3.client import Client
import sys

def main(args):
    client = init_client()
    get_folder(client, "2021", "11", "30", "18", "00")
    execute_hugin_stitch()
    cleanup_working_directory()
    post_result(client)


def get_and_save_image_locally(year, month, day, hour, minutes):
    date = "/" + year + "/" + month + "/" + day + "/" + hour + minutes + "/"
    site = "https://mesos.ui.sav.sk:444/index.php/apps/files/?dir=/Microstep/" + date + "/90_FULLHD/"
    print(site)
    response = requests.get(site, auth = HTTPBasicAuth('username', 'password'))
    soup = BeautifulSoup(response.text, 'html.parser')
    image_tags = soup.find_all('img')
    urls = [img['src'] for img in image_tags]
    for url in urls:
        filename = re.search(r'/([\w_-]+[.](jpg|gif|png))$', url)
        if not filename:
             print("Regular expression didn't match with the url: {}".format(url))
             continue
        with open(filename.group(1), 'wb') as f:
            if 'http' not in url:
                url = '{}{}'.format(site, url)
            response = requests.get(url, auth = HTTPBasicAuth('username', 'password'))
            f.write(response.content)
    print("Download complete, downloaded images can be found in current directory!")
    
def init_client():
    options = {
    'webdav_hostname':"https://mesos.ui.sav.sk:444/remote.php/webdav/",
    'webdav_login':    "username",
    'webdav_password': "password"
    }
    client = Client(options)
    client.list()
    return client

def move_files_to_working_directory(source_dir):
    target_dir = 'C:/Users/lukasu/Documents/sav/hugin-0.7/hugin/wrk/'
    
    file_names = os.listdir(source_dir)
    for file_name in file_names:
        shutil.move(os.path.join(source_dir, file_name), target_dir)
    
def get_folder(client, year, month, day, hour, minutes):
    date = "/" + year + "/" + month + "/" + day + "/" + hour + minutes + "/"
    path = "/Microstep/" + date + "/90_FULLHD/"
    client.download_sync(remote_path=path, local_path="/tmp_img/") #C:/Users/lukasu/Documents/sav/hugin-0.7/hugin/tmp/
    move_files_to_working_directory("/tmp_img/")
    client.download_sync(remote_path="/Microstep/hugin/pto/", local_path="/tmp_pto/")
    move_files_to_working_directory("/tmp_pto/")

def post_result(client):
    client.upload_sync(remote_path="/Microstep/hugin/result/", local_path="/wrk/")

def execute_hugin_stitch():
    os.system('docker exec -it hugin bash -c "cd /wrk && hugin_executor --stitching project.pto"')
    
def cleanup_working_directory():
    folder = "/wrk/"
    for filename in os.listdir(folder):
        file_path = os.path.join(folder, filename)
        try:
            if os.path.isfile(file_path) or os.path.islink(file_path):
                if " - " not in file_path:
                    os.unlink(file_path)
            elif os.path.isdir(file_path):
                shutil.rmtree(file_path)
        except Exception as e:
            print('Failed to delete %s. Reason: %s' % (file_path, e))

if __name__ == '__main__':
    main(sys.argv)

