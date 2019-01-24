%% Demo 1: Use surface normals

% Add path
addpath(genpath('../nricp'));
addpath(genpath('../../toolbox_graph/toolbox_graph/'));
addpath(genpath('../../icp'));

% Load data
load('../data/faceSource.mat');
load('../data/faceTarget.mat');

% Specify that surface normals are available and can be used.
Options.useNormals = 1;

% Specify that the source deformations should be plotted.
Options.plot = 1;

% Perform non-rigid ICP
[pointsTransformed, X] = nricp(Source, Target, Options);
faces = double(Source.faces);
save('../output/point_cloud/vertices_demo.txt', 'pointsTransformed', '-ascii');
save('../output/point_cloud/faces_demo.txt', 'faces', '-ascii');
