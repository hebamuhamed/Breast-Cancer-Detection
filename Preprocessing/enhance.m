%%
close all;
%%
path_directory='D:\College\Fourth Year\Grad Project\Code\classes\og\MLOr';
original_files=dir([path_directory '/*.jpg']); 
for k=1:length(original_files)
    filename=[path_directory '/' original_files(k).name];
    fprintf('done %d %s \n',k,filename)
    I=imread(filename);
    %I=rgb2gray(I);
    M=medfilt2(I);
    C = adapthisteq(M,'clipLimit',0.004);
    S = imsharpen(C);
    imwrite(S,filename);
    fprintf('done %d %s \n',k,filename)
end