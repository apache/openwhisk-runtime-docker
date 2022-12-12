#! /usr/bin/python
import json
import re
import time
import settings

import requests
from bs4 import BeautifulSoup
from requests.auth import HTTPBasicAuth
import os
import shutil
from webdav3.client import Client
import sys

def main(args):
    client = init_client()
    arg_dict = json.loads(args[1])
    get_folder(client, arg_dict['year'], arg_dict['month'], arg_dict['day'], arg_dict['hour'], arg_dict['minute'])
    execute_hugin_stitch()
    cleanup_working_directory()
    post_result(client)
    delete_directories()
    print("{\"result\": \"OK\"}")


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
    'webdav_hostname':settings.webdav_hostname,
    'webdav_login': settings.webdav_login,
    'webdav_password': settings.webdav_password
    }
    client = Client(options)
    client.list()
    return client

def move_files_to_directory(source_dir, target_dir):
    target_dir = settings.working_dir
    #shutil.rmtree(target_dir, ignore_errors=True)
    #os.makedirs(target_dir)
    file_names = os.listdir(source_dir)
    for file_name in file_names:
        shutil.move(os.path.join(source_dir, file_name), target_dir)
    
def get_folder(client, year, month, day, hour, minutes):
    date = "/" + year + "/" + month + "/" + day + "/" + hour + minutes + "/"
    path = "/Microstep" + date + "90_FULLHD/"
    shutil.rmtree(settings.working_dir, ignore_errors=True)
    os.makedirs(settings.working_dir)
    shutil.rmtree(settings.tmp_img, ignore_errors=True)
    os.makedirs(settings.tmp_img)
    shutil.rmtree(settings.tmp_pto, ignore_errors=True)
    os.makedirs(settings.tmp_pto)
    client.download_sync(remote_path=path, local_path=settings.tmp_img) #C:/Users/lukasu/Documents/sav/hugin-0.7/hugin/tmp/
    move_files_to_directory(settings.tmp_img, settings.working_dir)
    client.download_sync(remote_path="/Microstep/hugin/pto/", local_path=settings.tmp_pto)
    move_files_to_directory(settings.tmp_pto, settings.working_dir)

def post_result(client):
    client.upload_sync(remote_path="/Microstep/hugin/result/", local_path=settings.working_dir)

def execute_hugin_stitch():
    os.system('bash -c "cd {} && hugin_executor --stitching project.pto"'.format(settings.working_dir))
    
def cleanup_working_directory():
    folder = settings.working_dir
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

def delete_directories():
    shutil.rmtree(settings.tmp_img, ignore_errors=True)
    shutil.rmtree(settings.tmp_pto, ignore_errors=True)
    shutil.rmtree(settings.working_dir, ignore_errors=True)

if __name__ == '__main__':
    main(sys.argv)

