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

% Specify that the landmarks term are available and can be used.
Options.landmarks = 0;

% Selected landmarks
ls_source = [];
ls_target = [];

% Perform non-rigid ICP
[pointsTransformed, X] = nricp_landmarks(Source, Target, Options, ls_source, ls_target);
faces = double(Source.faces);
save('../output/point_cloud/vertices_demo.txt', 'pointsTransformed', '-ascii');
save('../output/point_cloud/faces_demo.txt', 'faces', '-ascii');

% Save obj file
filename = '../demo.obj';
saveObj(filename, pointsTransformed, faces);
