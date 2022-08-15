#!/bin/bash
yt-dlp -F $1 >yt.txt
sed -n '/audio/w au.txt' yt.txt
sed -n '/video/w vi.txt' yt.txt
sed -n '/audio/{/webm/p}' au.txt  >au1.txt 
sed -n '/video/{/webm/p}' vi.txt  >vi1.txt
aunumber=$(sed -n '$p' au1.txt | awk '{print $1}' )
vinumber=$(sed -n '$p' vi1.txt | awk '{print $1}' )
yt-dlp -f $vinumber+$aunumber $1
