
# makefile for panorama stitching, created by hugin using the new makefilelib

# Tool configuration
NONA=nona
PTSTITCHER=PTStitcher
PTMENDER=PTmender
PTBLENDER=PTblender
PTMASKER=PTmasker
PTROLLER=PTroller
ENBLEND=enblend
ENFUSE=enfuse
SMARTBLEND=smartblend.exe
HDRMERGE=hugin_hdrmerge
RM=rm
EXIFTOOL=exiftool
CHECKPTO=checkpto

# Project parameters
HUGIN_PROJECTION=9
HUGIN_HFOV=360
HUGIN_WIDTH=3796
HUGIN_HEIGHT=2684

# options for the programs
NONA_LDR_REMAPPED_COMP=-z LZW 
NONA_OPTS=
ENBLEND_OPTS= -w -f2684x2684+588+0
ENBLEND_LDR_COMP=--compression=90
ENBLEND_EXPOSURE_COMP=--compression=LZW 
ENBLEND_HDR_COMP=
HDRMERGE_OPTS=-m avg -c
ENFUSE_OPTS= -w
EXIFTOOL_COPY_ARGFILE=/usr/share/hugin/data/hugin_exiftool_copy.arg
EXIFTOOL_INFO_ARGFILE=test.pto_test.arg
EXIFTOOL_INFO_ARGFILE_SHELL=test.pto_test.arg

# the output panorama
LDR_REMAPPED_PREFIX=test
LDR_REMAPPED_PREFIX_SHELL=test
HDR_STACK_REMAPPED_PREFIX=test_hdr_
HDR_STACK_REMAPPED_PREFIX_SHELL=test_hdr_
LDR_EXPOSURE_REMAPPED_PREFIX=test_exposure_layers_
LDR_EXPOSURE_REMAPPED_PREFIX_SHELL=test_exposure_layers_
PROJECT_FILE=test.pto
PROJECT_FILE_SHELL=test.pto
LDR_BLENDED=test.jpg
LDR_BLENDED_SHELL=test.jpg
LDR_STACKED_BLENDED=test_fused.jpg
LDR_STACKED_BLENDED_SHELL=test_fused.jpg
LDR_EXPOSURE_LAYERS_FUSED=test_blended_fused.jpg
LDR_EXPOSURE_LAYERS_FUSED_SHELL=test_blended_fused.jpg
HDR_BLENDED=test_hdr.exr
HDR_BLENDED_SHELL=test_hdr.exr

# first input image
INPUT_IMAGE_1=0000.jpg
INPUT_IMAGE_1_SHELL=0000.jpg

# all input images
INPUT_IMAGES=0000.jpg\
0001.jpg\
0002.jpg\
0003.jpg\
0004.jpg\
0005.jpg\
0006.jpg\
0007.jpg
INPUT_IMAGES_SHELL=0000.jpg\
0001.jpg\
0002.jpg\
0003.jpg\
0004.jpg\
0005.jpg\
0006.jpg\
0007.jpg

# remapped images
LDR_LAYERS=test0000.tif\
test0001.tif\
test0002.tif\
test0003.tif\
test0004.tif\
test0005.tif\
test0006.tif\
test0007.tif
LDR_LAYERS_SHELL=test0000.tif\
test0001.tif\
test0002.tif\
test0003.tif\
test0004.tif\
test0005.tif\
test0006.tif\
test0007.tif

# remapped images (hdr)
HDR_LAYERS=test_hdr_0000.exr\
test_hdr_0001.exr\
test_hdr_0002.exr\
test_hdr_0003.exr\
test_hdr_0004.exr\
test_hdr_0005.exr\
test_hdr_0006.exr\
test_hdr_0007.exr
HDR_LAYERS_SHELL=test_hdr_0000.exr\
test_hdr_0001.exr\
test_hdr_0002.exr\
test_hdr_0003.exr\
test_hdr_0004.exr\
test_hdr_0005.exr\
test_hdr_0006.exr\
test_hdr_0007.exr

# remapped maxval images
HDR_LAYERS_WEIGHTS=test_hdr_0000_gray.pgm\
test_hdr_0001_gray.pgm\
test_hdr_0002_gray.pgm\
test_hdr_0003_gray.pgm\
test_hdr_0004_gray.pgm\
test_hdr_0005_gray.pgm\
test_hdr_0006_gray.pgm\
test_hdr_0007_gray.pgm
HDR_LAYERS_WEIGHTS_SHELL=test_hdr_0000_gray.pgm\
test_hdr_0001_gray.pgm\
test_hdr_0002_gray.pgm\
test_hdr_0003_gray.pgm\
test_hdr_0004_gray.pgm\
test_hdr_0005_gray.pgm\
test_hdr_0006_gray.pgm\
test_hdr_0007_gray.pgm

# stacked hdr images
HDR_STACK_0=test_stack_hdr_0000.exr
HDR_STACK_0_SHELL=test_stack_hdr_0000.exr
HDR_STACK_0_INPUT=test_hdr_0000.exr
HDR_STACK_0_INPUT_SHELL=test_hdr_0000.exr
HDR_STACK_1=test_stack_hdr_0001.exr
HDR_STACK_1_SHELL=test_stack_hdr_0001.exr
HDR_STACK_1_INPUT=test_hdr_0001.exr
HDR_STACK_1_INPUT_SHELL=test_hdr_0001.exr
HDR_STACK_2=test_stack_hdr_0002.exr
HDR_STACK_2_SHELL=test_stack_hdr_0002.exr
HDR_STACK_2_INPUT=test_hdr_0002.exr
HDR_STACK_2_INPUT_SHELL=test_hdr_0002.exr
HDR_STACK_3=test_stack_hdr_0003.exr
HDR_STACK_3_SHELL=test_stack_hdr_0003.exr
HDR_STACK_3_INPUT=test_hdr_0003.exr
HDR_STACK_3_INPUT_SHELL=test_hdr_0003.exr
HDR_STACK_4=test_stack_hdr_0004.exr
HDR_STACK_4_SHELL=test_stack_hdr_0004.exr
HDR_STACK_4_INPUT=test_hdr_0004.exr
HDR_STACK_4_INPUT_SHELL=test_hdr_0004.exr
HDR_STACK_5=test_stack_hdr_0005.exr
HDR_STACK_5_SHELL=test_stack_hdr_0005.exr
HDR_STACK_5_INPUT=test_hdr_0005.exr
HDR_STACK_5_INPUT_SHELL=test_hdr_0005.exr
HDR_STACK_6=test_stack_hdr_0006.exr
HDR_STACK_6_SHELL=test_stack_hdr_0006.exr
HDR_STACK_6_INPUT=test_hdr_0006.exr
HDR_STACK_6_INPUT_SHELL=test_hdr_0006.exr
HDR_STACK_7=test_stack_hdr_0007.exr
HDR_STACK_7_SHELL=test_stack_hdr_0007.exr
HDR_STACK_7_INPUT=test_hdr_0007.exr
HDR_STACK_7_INPUT_SHELL=test_hdr_0007.exr
HDR_STACKS_NUMBERS=0 1 2 3 4 5 6 7 
HDR_STACKS=$(HDR_STACK_0) $(HDR_STACK_1) $(HDR_STACK_2) $(HDR_STACK_3) $(HDR_STACK_4) $(HDR_STACK_5) $(HDR_STACK_6) $(HDR_STACK_7) 
HDR_STACKS_SHELL=$(HDR_STACK_0_SHELL) $(HDR_STACK_1_SHELL) $(HDR_STACK_2_SHELL) $(HDR_STACK_3_SHELL) $(HDR_STACK_4_SHELL) $(HDR_STACK_5_SHELL) $(HDR_STACK_6_SHELL) $(HDR_STACK_7_SHELL) 

# number of image sets with similar exposure
LDR_EXPOSURE_LAYER_0=test_exposure_0000.tif
LDR_EXPOSURE_LAYER_0_SHELL=test_exposure_0000.tif
LDR_EXPOSURE_LAYER_0_INPUT=test_exposure_layers_0000.tif\
test_exposure_layers_0001.tif\
test_exposure_layers_0002.tif\
test_exposure_layers_0003.tif\
test_exposure_layers_0004.tif\
test_exposure_layers_0005.tif
LDR_EXPOSURE_LAYER_0_INPUT_SHELL=test_exposure_layers_0000.tif\
test_exposure_layers_0001.tif\
test_exposure_layers_0002.tif\
test_exposure_layers_0003.tif\
test_exposure_layers_0004.tif\
test_exposure_layers_0005.tif
LDR_EXPOSURE_LAYER_0_INPUT_PTMENDER=test0000.tif\
test0001.tif\
test0002.tif\
test0003.tif\
test0004.tif\
test0005.tif
LDR_EXPOSURE_LAYER_0_INPUT_PTMENDER_SHELL=test0000.tif\
test0001.tif\
test0002.tif\
test0003.tif\
test0004.tif\
test0005.tif
LDR_EXPOSURE_LAYER_0_EXPOSURE=0.0809202
LDR_EXPOSURE_LAYER_1=test_exposure_0001.tif
LDR_EXPOSURE_LAYER_1_SHELL=test_exposure_0001.tif
LDR_EXPOSURE_LAYER_1_INPUT=test_exposure_layers_0006.tif\
test_exposure_layers_0007.tif
LDR_EXPOSURE_LAYER_1_INPUT_SHELL=test_exposure_layers_0006.tif\
test_exposure_layers_0007.tif
LDR_EXPOSURE_LAYER_1_INPUT_PTMENDER=test0006.tif\
test0007.tif
LDR_EXPOSURE_LAYER_1_INPUT_PTMENDER_SHELL=test0006.tif\
test0007.tif
LDR_EXPOSURE_LAYER_1_EXPOSURE=1.03447
LDR_EXPOSURE_LAYERS_NUMBERS=0 1 
LDR_EXPOSURE_LAYERS=$(LDR_EXPOSURE_LAYER_0) $(LDR_EXPOSURE_LAYER_1) 
LDR_EXPOSURE_LAYERS_SHELL=$(LDR_EXPOSURE_LAYER_0_SHELL) $(LDR_EXPOSURE_LAYER_1_SHELL) 
LDR_EXPOSURE_LAYERS_REMAPPED=test_exposure_layers_0000.tif\
test_exposure_layers_0001.tif\
test_exposure_layers_0002.tif\
test_exposure_layers_0003.tif\
test_exposure_layers_0004.tif\
test_exposure_layers_0005.tif\
test_exposure_layers_0006.tif\
test_exposure_layers_0007.tif
LDR_EXPOSURE_LAYERS_REMAPPED_SHELL=test_exposure_layers_0000.tif\
test_exposure_layers_0001.tif\
test_exposure_layers_0002.tif\
test_exposure_layers_0003.tif\
test_exposure_layers_0004.tif\
test_exposure_layers_0005.tif\
test_exposure_layers_0006.tif\
test_exposure_layers_0007.tif

# stacked ldr images
LDR_STACK_0=test_stack_ldr_0000.tif
LDR_STACK_0_SHELL=test_stack_ldr_0000.tif
LDR_STACK_0_INPUT=test_exposure_layers_0000.tif
LDR_STACK_0_INPUT_SHELL=test_exposure_layers_0000.tif
LDR_STACK_1=test_stack_ldr_0001.tif
LDR_STACK_1_SHELL=test_stack_ldr_0001.tif
LDR_STACK_1_INPUT=test_exposure_layers_0001.tif
LDR_STACK_1_INPUT_SHELL=test_exposure_layers_0001.tif
LDR_STACK_2=test_stack_ldr_0002.tif
LDR_STACK_2_SHELL=test_stack_ldr_0002.tif
LDR_STACK_2_INPUT=test_exposure_layers_0002.tif
LDR_STACK_2_INPUT_SHELL=test_exposure_layers_0002.tif
LDR_STACK_3=test_stack_ldr_0003.tif
LDR_STACK_3_SHELL=test_stack_ldr_0003.tif
LDR_STACK_3_INPUT=test_exposure_layers_0003.tif
LDR_STACK_3_INPUT_SHELL=test_exposure_layers_0003.tif
LDR_STACK_4=test_stack_ldr_0004.tif
LDR_STACK_4_SHELL=test_stack_ldr_0004.tif
LDR_STACK_4_INPUT=test_exposure_layers_0004.tif
LDR_STACK_4_INPUT_SHELL=test_exposure_layers_0004.tif
LDR_STACK_5=test_stack_ldr_0005.tif
LDR_STACK_5_SHELL=test_stack_ldr_0005.tif
LDR_STACK_5_INPUT=test_exposure_layers_0005.tif
LDR_STACK_5_INPUT_SHELL=test_exposure_layers_0005.tif
LDR_STACK_6=test_stack_ldr_0006.tif
LDR_STACK_6_SHELL=test_stack_ldr_0006.tif
LDR_STACK_6_INPUT=test_exposure_layers_0006.tif
LDR_STACK_6_INPUT_SHELL=test_exposure_layers_0006.tif
LDR_STACK_7=test_stack_ldr_0007.tif
LDR_STACK_7_SHELL=test_stack_ldr_0007.tif
LDR_STACK_7_INPUT=test_exposure_layers_0007.tif
LDR_STACK_7_INPUT_SHELL=test_exposure_layers_0007.tif
LDR_STACKS_NUMBERS=0 1 2 3 4 5 6 7 
LDR_STACKS=$(LDR_STACK_0) $(LDR_STACK_1) $(LDR_STACK_2) $(LDR_STACK_3) $(LDR_STACK_4) $(LDR_STACK_5) $(LDR_STACK_6) $(LDR_STACK_7) 
LDR_STACKS_SHELL=$(LDR_STACK_0_SHELL) $(LDR_STACK_1_SHELL) $(LDR_STACK_2_SHELL) $(LDR_STACK_3_SHELL) $(LDR_STACK_4_SHELL) $(LDR_STACK_5_SHELL) $(LDR_STACK_6_SHELL) $(LDR_STACK_7_SHELL) 
DO_LDR_BLENDED=1

all : startStitching $(LDR_BLENDED) 

startStitching : 
	@echo '==========================================================================='
	@echo 'Stitching panorama'
	@echo '==========================================================================='

clean : 
	@echo '==========================================================================='
	@echo 'Remove temporary files'
	@echo '==========================================================================='
	-$(RM) $(EXIFTOOL_INFO_ARGFILE_SHELL) $(LDR_LAYERS_SHELL) 

test : 
	@echo '==========================================================================='
	@echo 'Testing programs'
	@echo '==========================================================================='
	@echo -n 'Checking nona...'
	@-$(NONA) --help > /dev/null 2>&1 && echo '[OK]' || echo '[FAILED]'
	@echo -n 'Checking enblend...'
	@-$(ENBLEND) -h > /dev/null 2>&1 && echo '[OK]' || echo '[FAILED]'
	@echo -n 'Checking enfuse...'
	@-$(ENFUSE) -h > /dev/null 2>&1 && echo '[OK]' || echo '[FAILED]'
	@echo -n 'Checking hugin_hdrmerge...'
	@-$(HDRMERGE) -h > /dev/null 2>&1 && echo '[OK]' || echo '[FAILED]'
	@echo -n 'Checking exiftool...'
	@-$(EXIFTOOL) -ver > /dev/null 2>&1 && echo '[OK]' || echo '[FAILED]'

info : 
	@echo '==========================================================================='
	@echo '***************  Panorama makefile generated by Hugin       ***************'
	@echo '==========================================================================='
	@echo 'System information'
	@echo '==========================================================================='
	@echo -n 'Operating system: '
	@-uname -o
	@echo -n 'Release: '
	@-uname -r
	@echo -n 'Kernel version: '
	@-uname -v
	@echo -n 'Machine: '
	@-uname -m
	@echo 'Disc usage'
	@-df -h
	@echo 'Memory usage'
	@-free -m
	@echo '==========================================================================='
	@echo 'Output options'
	@echo '==========================================================================='
	@echo 'Hugin Version: 2014.0.0.5da69bc383dd'
	@echo 'Project file: test.pto'
	@echo 'Output prefix: test'
	@echo 'Projection: Lambert Equal Area Azimuthal (9)'
	@echo 'Field of view: 360 x 180'
	@echo 'Canvas dimensions: 3796 x 2684'
	@echo 'Crop area: (588,0) - (3272,2684)'
	@echo 'Output exposure value: 0.32'
	@echo 'Output stacks minimum overlap: 0.700'
	@echo 'Output layers maximum Ev difference: 0.50'
	@echo 'Selected outputs'
	@echo 'Normal panorama'
	@echo '* Blended panorama'
	@echo '==========================================================================='
	@echo 'Input images'
	@echo '==========================================================================='
	@echo 'Number of images in project file: 8'
	@echo 'Number of active images: 8'
	@echo 'Image 0: 0000.jpg'
	@echo 'Image 0: Size 1920x1200, Exposure: 0.00'
	@echo 'Image 1: 0001.jpg'
	@echo 'Image 1: Size 1920x1200, Exposure: -0.29'
	@echo 'Image 2: 0002.jpg'
	@echo 'Image 2: Size 1920x1200, Exposure: -0.15'
	@echo 'Image 3: 0003.jpg'
	@echo 'Image 3: Size 1920x1200, Exposure: 0.22'
	@echo 'Image 4: 0004.jpg'
	@echo 'Image 4: Size 1920x1200, Exposure: 0.37'
	@echo 'Image 5: 0005.jpg'
	@echo 'Image 5: Size 1920x1200, Exposure: 0.34'
	@echo 'Image 6: 0006.jpg'
	@echo 'Image 6: Size 1920x1200, Exposure: 1.12'
	@echo 'Image 7: 0007.jpg'
	@echo 'Image 7: Size 1920x1200, Exposure: 0.95'

# Rules for ordinary TIFF_m and hdr output

test0000.tif : 0000.jpg $(PROJECT_FILE) 
	$(NONA) $(NONA_OPTS) $(NONA_LDR_REMAPPED_COMP) -r ldr -m TIFF_m -o $(LDR_REMAPPED_PREFIX_SHELL) -i 0 $(PROJECT_FILE_SHELL)

test_hdr_0000.exr : 0000.jpg $(PROJECT_FILE) 
	$(NONA) $(NONA_OPTS) -r hdr -m EXR_m -o $(HDR_STACK_REMAPPED_PREFIX_SHELL) -i 0 $(PROJECT_FILE_SHELL)

test0001.tif : 0001.jpg $(PROJECT_FILE) 
	$(NONA) $(NONA_OPTS) $(NONA_LDR_REMAPPED_COMP) -r ldr -m TIFF_m -o $(LDR_REMAPPED_PREFIX_SHELL) -i 1 $(PROJECT_FILE_SHELL)

test_hdr_0001.exr : 0001.jpg $(PROJECT_FILE) 
	$(NONA) $(NONA_OPTS) -r hdr -m EXR_m -o $(HDR_STACK_REMAPPED_PREFIX_SHELL) -i 1 $(PROJECT_FILE_SHELL)

test0002.tif : 0002.jpg $(PROJECT_FILE) 
	$(NONA) $(NONA_OPTS) $(NONA_LDR_REMAPPED_COMP) -r ldr -m TIFF_m -o $(LDR_REMAPPED_PREFIX_SHELL) -i 2 $(PROJECT_FILE_SHELL)

test_hdr_0002.exr : 0002.jpg $(PROJECT_FILE) 
	$(NONA) $(NONA_OPTS) -r hdr -m EXR_m -o $(HDR_STACK_REMAPPED_PREFIX_SHELL) -i 2 $(PROJECT_FILE_SHELL)

test0003.tif : 0003.jpg $(PROJECT_FILE) 
	$(NONA) $(NONA_OPTS) $(NONA_LDR_REMAPPED_COMP) -r ldr -m TIFF_m -o $(LDR_REMAPPED_PREFIX_SHELL) -i 3 $(PROJECT_FILE_SHELL)

test_hdr_0003.exr : 0003.jpg $(PROJECT_FILE) 
	$(NONA) $(NONA_OPTS) -r hdr -m EXR_m -o $(HDR_STACK_REMAPPED_PREFIX_SHELL) -i 3 $(PROJECT_FILE_SHELL)

test0004.tif : 0004.jpg $(PROJECT_FILE) 
	$(NONA) $(NONA_OPTS) $(NONA_LDR_REMAPPED_COMP) -r ldr -m TIFF_m -o $(LDR_REMAPPED_PREFIX_SHELL) -i 4 $(PROJECT_FILE_SHELL)

test_hdr_0004.exr : 0004.jpg $(PROJECT_FILE) 
	$(NONA) $(NONA_OPTS) -r hdr -m EXR_m -o $(HDR_STACK_REMAPPED_PREFIX_SHELL) -i 4 $(PROJECT_FILE_SHELL)

test0005.tif : 0005.jpg $(PROJECT_FILE) 
	$(NONA) $(NONA_OPTS) $(NONA_LDR_REMAPPED_COMP) -r ldr -m TIFF_m -o $(LDR_REMAPPED_PREFIX_SHELL) -i 5 $(PROJECT_FILE_SHELL)

test_hdr_0005.exr : 0005.jpg $(PROJECT_FILE) 
	$(NONA) $(NONA_OPTS) -r hdr -m EXR_m -o $(HDR_STACK_REMAPPED_PREFIX_SHELL) -i 5 $(PROJECT_FILE_SHELL)

test0006.tif : 0006.jpg $(PROJECT_FILE) 
	$(NONA) $(NONA_OPTS) $(NONA_LDR_REMAPPED_COMP) -r ldr -m TIFF_m -o $(LDR_REMAPPED_PREFIX_SHELL) -i 6 $(PROJECT_FILE_SHELL)

test_hdr_0006.exr : 0006.jpg $(PROJECT_FILE) 
	$(NONA) $(NONA_OPTS) -r hdr -m EXR_m -o $(HDR_STACK_REMAPPED_PREFIX_SHELL) -i 6 $(PROJECT_FILE_SHELL)

test0007.tif : 0007.jpg $(PROJECT_FILE) 
	$(NONA) $(NONA_OPTS) $(NONA_LDR_REMAPPED_COMP) -r ldr -m TIFF_m -o $(LDR_REMAPPED_PREFIX_SHELL) -i 7 $(PROJECT_FILE_SHELL)

test_hdr_0007.exr : 0007.jpg $(PROJECT_FILE) 
	$(NONA) $(NONA_OPTS) -r hdr -m EXR_m -o $(HDR_STACK_REMAPPED_PREFIX_SHELL) -i 7 $(PROJECT_FILE_SHELL)

# Rules for exposure layer output

test_exposure_layers_0000.tif : 0000.jpg $(PROJECT_FILE) 
	$(NONA) $(NONA_OPTS) $(NONA_LDR_REMAPPED_COMP) -r ldr -e 0 -m TIFF_m -o $(LDR_EXPOSURE_REMAPPED_PREFIX_SHELL) -i 0 $(PROJECT_FILE_SHELL)

test_exposure_layers_0001.tif : 0001.jpg $(PROJECT_FILE) 
	$(NONA) $(NONA_OPTS) $(NONA_LDR_REMAPPED_COMP) -r ldr -e -0.293092 -m TIFF_m -o $(LDR_EXPOSURE_REMAPPED_PREFIX_SHELL) -i 1 $(PROJECT_FILE_SHELL)

test_exposure_layers_0002.tif : 0002.jpg $(PROJECT_FILE) 
	$(NONA) $(NONA_OPTS) $(NONA_LDR_REMAPPED_COMP) -r ldr -e -0.153933 -m TIFF_m -o $(LDR_EXPOSURE_REMAPPED_PREFIX_SHELL) -i 2 $(PROJECT_FILE_SHELL)

test_exposure_layers_0003.tif : 0003.jpg $(PROJECT_FILE) 
	$(NONA) $(NONA_OPTS) $(NONA_LDR_REMAPPED_COMP) -r ldr -e 0.220174 -m TIFF_m -o $(LDR_EXPOSURE_REMAPPED_PREFIX_SHELL) -i 3 $(PROJECT_FILE_SHELL)

test_exposure_layers_0004.tif : 0004.jpg $(PROJECT_FILE) 
	$(NONA) $(NONA_OPTS) $(NONA_LDR_REMAPPED_COMP) -r ldr -e 0.370559 -m TIFF_m -o $(LDR_EXPOSURE_REMAPPED_PREFIX_SHELL) -i 4 $(PROJECT_FILE_SHELL)

test_exposure_layers_0005.tif : 0005.jpg $(PROJECT_FILE) 
	$(NONA) $(NONA_OPTS) $(NONA_LDR_REMAPPED_COMP) -r ldr -e 0.341814 -m TIFF_m -o $(LDR_EXPOSURE_REMAPPED_PREFIX_SHELL) -i 5 $(PROJECT_FILE_SHELL)

test_exposure_layers_0006.tif : 0006.jpg $(PROJECT_FILE) 
	$(NONA) $(NONA_OPTS) $(NONA_LDR_REMAPPED_COMP) -r ldr -e 1.12007 -m TIFF_m -o $(LDR_EXPOSURE_REMAPPED_PREFIX_SHELL) -i 6 $(PROJECT_FILE_SHELL)

test_exposure_layers_0007.tif : 0007.jpg $(PROJECT_FILE) 
	$(NONA) $(NONA_OPTS) $(NONA_LDR_REMAPPED_COMP) -r ldr -e 0.948872 -m TIFF_m -o $(LDR_EXPOSURE_REMAPPED_PREFIX_SHELL) -i 7 $(PROJECT_FILE_SHELL)

# Rules for LDR and HDR stack merging, a rule for each stack

$(LDR_STACK_0) : $(LDR_STACK_0_INPUT) 
	$(ENFUSE) $(ENFUSE_OPTS) -o $(LDR_STACK_0_SHELL) -- $(LDR_STACK_0_INPUT_SHELL)
	-$(EXIFTOOL) -overwrite_original_in_place -TagsFromFile $(INPUT_IMAGE_1_SHELL) -WhitePoint -ColorSpace -@ $(EXIFTOOL_COPY_ARGFILE) $(LDR_STACK_0_SHELL)

$(HDR_STACK_0) : $(HDR_STACK_0_INPUT) 
	$(HDRMERGE) $(HDRMERGE_OPTS) -o $(HDR_STACK_0_SHELL) -- $(HDR_STACK_0_INPUT_SHELL)

$(LDR_STACK_1) : $(LDR_STACK_1_INPUT) 
	$(ENFUSE) $(ENFUSE_OPTS) -o $(LDR_STACK_1_SHELL) -- $(LDR_STACK_1_INPUT_SHELL)
	-$(EXIFTOOL) -overwrite_original_in_place -TagsFromFile $(INPUT_IMAGE_1_SHELL) -WhitePoint -ColorSpace -@ $(EXIFTOOL_COPY_ARGFILE) $(LDR_STACK_1_SHELL)

$(HDR_STACK_1) : $(HDR_STACK_1_INPUT) 
	$(HDRMERGE) $(HDRMERGE_OPTS) -o $(HDR_STACK_1_SHELL) -- $(HDR_STACK_1_INPUT_SHELL)

$(LDR_STACK_2) : $(LDR_STACK_2_INPUT) 
	$(ENFUSE) $(ENFUSE_OPTS) -o $(LDR_STACK_2_SHELL) -- $(LDR_STACK_2_INPUT_SHELL)
	-$(EXIFTOOL) -overwrite_original_in_place -TagsFromFile $(INPUT_IMAGE_1_SHELL) -WhitePoint -ColorSpace -@ $(EXIFTOOL_COPY_ARGFILE) $(LDR_STACK_2_SHELL)

$(HDR_STACK_2) : $(HDR_STACK_2_INPUT) 
	$(HDRMERGE) $(HDRMERGE_OPTS) -o $(HDR_STACK_2_SHELL) -- $(HDR_STACK_2_INPUT_SHELL)

$(LDR_STACK_3) : $(LDR_STACK_3_INPUT) 
	$(ENFUSE) $(ENFUSE_OPTS) -o $(LDR_STACK_3_SHELL) -- $(LDR_STACK_3_INPUT_SHELL)
	-$(EXIFTOOL) -overwrite_original_in_place -TagsFromFile $(INPUT_IMAGE_1_SHELL) -WhitePoint -ColorSpace -@ $(EXIFTOOL_COPY_ARGFILE) $(LDR_STACK_3_SHELL)

$(HDR_STACK_3) : $(HDR_STACK_3_INPUT) 
	$(HDRMERGE) $(HDRMERGE_OPTS) -o $(HDR_STACK_3_SHELL) -- $(HDR_STACK_3_INPUT_SHELL)

$(LDR_STACK_4) : $(LDR_STACK_4_INPUT) 
	$(ENFUSE) $(ENFUSE_OPTS) -o $(LDR_STACK_4_SHELL) -- $(LDR_STACK_4_INPUT_SHELL)
	-$(EXIFTOOL) -overwrite_original_in_place -TagsFromFile $(INPUT_IMAGE_1_SHELL) -WhitePoint -ColorSpace -@ $(EXIFTOOL_COPY_ARGFILE) $(LDR_STACK_4_SHELL)

$(HDR_STACK_4) : $(HDR_STACK_4_INPUT) 
	$(HDRMERGE) $(HDRMERGE_OPTS) -o $(HDR_STACK_4_SHELL) -- $(HDR_STACK_4_INPUT_SHELL)

$(LDR_STACK_5) : $(LDR_STACK_5_INPUT) 
	$(ENFUSE) $(ENFUSE_OPTS) -o $(LDR_STACK_5_SHELL) -- $(LDR_STACK_5_INPUT_SHELL)
	-$(EXIFTOOL) -overwrite_original_in_place -TagsFromFile $(INPUT_IMAGE_1_SHELL) -WhitePoint -ColorSpace -@ $(EXIFTOOL_COPY_ARGFILE) $(LDR_STACK_5_SHELL)

$(HDR_STACK_5) : $(HDR_STACK_5_INPUT) 
	$(HDRMERGE) $(HDRMERGE_OPTS) -o $(HDR_STACK_5_SHELL) -- $(HDR_STACK_5_INPUT_SHELL)

$(LDR_STACK_6) : $(LDR_STACK_6_INPUT) 
	$(ENFUSE) $(ENFUSE_OPTS) -o $(LDR_STACK_6_SHELL) -- $(LDR_STACK_6_INPUT_SHELL)
	-$(EXIFTOOL) -overwrite_original_in_place -TagsFromFile $(INPUT_IMAGE_1_SHELL) -WhitePoint -ColorSpace -@ $(EXIFTOOL_COPY_ARGFILE) $(LDR_STACK_6_SHELL)

$(HDR_STACK_6) : $(HDR_STACK_6_INPUT) 
	$(HDRMERGE) $(HDRMERGE_OPTS) -o $(HDR_STACK_6_SHELL) -- $(HDR_STACK_6_INPUT_SHELL)

$(LDR_STACK_7) : $(LDR_STACK_7_INPUT) 
	$(ENFUSE) $(ENFUSE_OPTS) -o $(LDR_STACK_7_SHELL) -- $(LDR_STACK_7_INPUT_SHELL)
	-$(EXIFTOOL) -overwrite_original_in_place -TagsFromFile $(INPUT_IMAGE_1_SHELL) -WhitePoint -ColorSpace -@ $(EXIFTOOL_COPY_ARGFILE) $(LDR_STACK_7_SHELL)

$(HDR_STACK_7) : $(HDR_STACK_7_INPUT) 
	$(HDRMERGE) $(HDRMERGE_OPTS) -o $(HDR_STACK_7_SHELL) -- $(HDR_STACK_7_INPUT_SHELL)

$(EXIFTOOL_INFO_ARGFILE) : $(PROJECT_FILE) 
	$(CHECKPTO) --generate-argfile=$(EXIFTOOL_INFO_ARGFILE_SHELL) $(PROJECT_FILE_SHELL)

$(LDR_BLENDED) : $(LDR_LAYERS) $(EXIFTOOL_INFO_ARGFILE) 
	$(ENBLEND) $(ENBLEND_LDR_COMP) $(ENBLEND_OPTS) -o $(LDR_BLENDED_SHELL) -- $(LDR_LAYERS_SHELL)
	-$(EXIFTOOL) -overwrite_original_in_place -TagsFromFile $(INPUT_IMAGE_1_SHELL) -WhitePoint -ColorSpace -@ $(EXIFTOOL_COPY_ARGFILE) -@ $(EXIFTOOL_INFO_ARGFILE_SHELL) $(LDR_BLENDED_SHELL)

$(LDR_EXPOSURE_LAYER_0) : $(LDR_EXPOSURE_LAYER_0_INPUT) 
	$(ENBLEND) $(ENBLEND_EXPOSURE_COMP) $(ENBLEND_OPTS) -o $(LDR_EXPOSURE_LAYER_0_SHELL) -- $(LDR_EXPOSURE_LAYER_0_INPUT_SHELL)
	-$(EXIFTOOL) -overwrite_original_in_place -TagsFromFile $(INPUT_IMAGE_1_SHELL) -WhitePoint -ColorSpace -@ $(EXIFTOOL_COPY_ARGFILE) $(LDR_EXPOSURE_LAYER_0_SHELL)

$(LDR_EXPOSURE_LAYER_1) : $(LDR_EXPOSURE_LAYER_1_INPUT) 
	$(ENBLEND) $(ENBLEND_EXPOSURE_COMP) $(ENBLEND_OPTS) -o $(LDR_EXPOSURE_LAYER_1_SHELL) -- $(LDR_EXPOSURE_LAYER_1_INPUT_SHELL)
	-$(EXIFTOOL) -overwrite_original_in_place -TagsFromFile $(INPUT_IMAGE_1_SHELL) -WhitePoint -ColorSpace -@ $(EXIFTOOL_COPY_ARGFILE) $(LDR_EXPOSURE_LAYER_1_SHELL)

$(LDR_STACKED_BLENDED) : $(LDR_STACKS) $(EXIFTOOL_INFO_ARGFILE) 
	$(ENBLEND) $(ENBLEND_LDR_COMP) $(ENBLEND_OPTS) -o $(LDR_STACKED_BLENDED_SHELL) -- $(LDR_STACKS_SHELL)
	-$(EXIFTOOL) -overwrite_original_in_place -TagsFromFile $(INPUT_IMAGE_1_SHELL) -WhitePoint -ColorSpace -@ $(EXIFTOOL_COPY_ARGFILE) -@ $(EXIFTOOL_INFO_ARGFILE_SHELL) $(LDR_STACKED_BLENDED_SHELL)

$(LDR_EXPOSURE_LAYERS_FUSED) : $(LDR_EXPOSURE_LAYERS) $(EXIFTOOL_INFO_ARGFILE) 
	$(ENFUSE) $(ENBLEND_LDR_COMP) $(ENFUSE_OPTS) -o $(LDR_EXPOSURE_LAYERS_FUSED_SHELL) -- $(LDR_EXPOSURE_LAYERS_SHELL)
	-$(EXIFTOOL) -overwrite_original_in_place -TagsFromFile $(INPUT_IMAGE_1_SHELL) -WhitePoint -ColorSpace -@ $(EXIFTOOL_COPY_ARGFILE) -@ $(EXIFTOOL_INFO_ARGFILE_SHELL) $(LDR_EXPOSURE_LAYERS_FUSED_SHELL)

$(HDR_BLENDED) : $(HDR_STACKS) 
	$(ENBLEND) $(ENBLEND_HDR_COMP) $(ENBLEND_OPTS) -o $(HDR_BLENDED_SHELL) -- $(HDR_STACKS_SHELL)

$(LDR_REMAPPED_PREFIX)_multilayer.tif : $(LDR_LAYERS) 
	tiffcp $(LDR_LAYERS_SHELL) $(LDR_REMAPPED_PREFIX_SHELL)_multilayer.tif

$(LDR_REMAPPED_PREFIX)_fused_multilayer.tif : $(LDR_STACKS) $(LDR_EXPOSURE_LAYERS) 
	tiffcp $(LDR_STACKS_SHELL) $(LDR_EXPOSURE_LAYERS_SHELL) $(LDR_REMAPPED_PREFIX_SHELL)_fused_multilayer.tif

$(LDR_REMAPPED_PREFIX)_multilayer.psd : $(LDR_LAYERS) 
	PTtiff2psd -o $(LDR_REMAPPED_PREFIX_SHELL)_multilayer.psd $(LDR_LAYERS_SHELL)

$(LDR_REMAPPED_PREFIX)_fused_multilayer.psd : $(LDR_STACKS) $(LDR_EXPOSURE_LAYERS) 
	PTtiff2psd -o $(LDR_REMAPPED_PREFIX_SHELL)_fused_multilayer.psd $(LDR_STACKS_SHELL)$(LDR_EXPOSURE_LAYERS_SHELL)
