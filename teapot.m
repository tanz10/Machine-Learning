clc
clear
close all

load teapots.mat
PCA(teapotImages);
function [] = PCA(image)


    [eigenVector eigenValues] = eig(cov(image));
    [eigenVector eigenValues] = sort(eigenValues, 'descend');

    coe = image * (eigenVector(:,1:3));
    step = coe * (eigenVector(:,1:3))';
    m = mean(image);
    center = [];

    for i=1:100
        center = [center; image(i,:)-m];
    end
    img = step + center;

    for i=1:10
        f = randi(100);
        figure();
        imagesc(reshape(image(f,:),38,50));
        title("before");
        colormap gray;

        figure();
        imagesc(reshape(img(f,:),38,50));
        title("after");
        colormap gray;
    end
end