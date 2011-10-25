% Collects the face masks for all of the images and saves them to disk
% project 4
% Jason, Blake, Jen

dirlist = dir('faces/*');
basedir = 'faces';

maskdir = 'masks';
        % This is a hack to reduce the amount of computation required per
        % iteration of the code. The perception of speed is inversely
        % proportional to the number of pictures that we have to calculate
        % the hue and distribution on. We still have to write the code to
        % find the mean and multiple peaks of the distribution curve.
        x = 7;
%for x=3: length(dirlist)
	if (dirlist(x).isdir==1)%make sure it's a dir
        imgdir = strcat(basedir,'/',dirlist(x).name);
        imgsearch = strcat(imgdir,'/*.jpg');
        maskfolder = strcat(maskdir,'/',dirlist(x).name);
        
        imlist=dir(imgsearch);
        
        for y=1: length(imlist)
            imgpath = strcat(imgdir,'/',imlist(y).name);
            img = imread(imgpath);
            maskpath = strcat(maskfolder,'/',imlist(y).name);
            mask = imread(maskpath);
            [facehue,otherhue] = huedist(img,mask);
            
            figure; 
            subplot(221);imhist(facehue);title('Face'); 
            
            x = 0:0.01:1;

            facemean = mymean(facehue(:));
            facevar = myvariance(facehue(:),facemean);

            y = gaussmf(x,[sqrt(facevar) facemean]);
            subplot(223); plot(x,y);


            subplot(222);imhist(otherhue); title('Other');

            othermean = mymean(otherhue(:));
            othervar = myvariance(otherhue(:),othermean);
            
            y = gaussmf(x,[sqrt(othervar) othermean]);
            subplot(224); plot(x,y);
            
        end
        

        
    end
%end

