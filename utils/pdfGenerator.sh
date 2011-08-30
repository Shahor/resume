#!/bin/bash
height=1680
width=1050
platform=`uname`

if [[ -z `which xvfb-run` && $platform ==  'Linux' ]]
then
	echo "xvfb is not installed, please install it first"
	error=1
fi

if [[ -z `which wkhtmltopdf` ]]
then
	echo "wkhtmltopdf is not installed, please install it first"
	error=1
fi

if [[ $error ]]
then exit
fi

if [[ $platform == 'Linux' ]]
then
	echo "Generating FR version"
	xvfb-run -a -s "-screen 0 ${height}x${width}x16" wkhtmltopdf --dpi 300  --page-size A4 index.html files/resume.pdf
	echo "Generating UK version"
	xvfb-run -a -s "-screen 0 ${height}x${width}x16" wkhtmltopdf --dpi 300  --page-size A4 index_en.html files/resume_en.pdf
elif [[ $platform == 'Darwin' ]]
then
	echo "Generating FR version"
	wkhtmltopdf --dpi 300  --page-size A4 index.html files/resume.pdf

	echo "Generating UK version"
	wkhtmltopdf --dpi 300  --page-size A4 index_en.html files/resume_en.pdf
else
	echo "Who are you ?"
fi

