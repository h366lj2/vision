% Collects the face masks for all of the images and saves them to disk
% project 3
% Jason, Blake, Jen

dirlist = dir('faces/*');
basedir = 'faces';

maskdir = 'masks';
mkdir masks;

for x=3: length(dirlist)
	if (dirlist(x).isdir==1)%make sure it's a dir
        imgdir = strcat(basedir,'/',dirlist(x).name);
        imgsearch = strcat(imgdir,'/*.jpg');
        
        imlist=dir(imgsearch);
       
        for y=1: length(imlist)
            imgpath = strcat(imgdir,'/',imlist(y).name);
            maskimage = plotdists(imgpath);

            maskpath = strcat(maskdir,'/',dirlist(x).name,'/',imlist(y).name);
            imwrite(maskimage,maskpath,'jpg');

        end
    end
end

manfacefind('./faces/1/image_0001.jpg');

mask = plotdists('./faces/landscape.jpg');
imwrite(mask,'masks/landscape','jpg');

mask = plotdists('./faces/group.jpg');
imwrite(mask,'masks/group','jpg');

