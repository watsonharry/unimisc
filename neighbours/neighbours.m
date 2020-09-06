%%
% set up random 3-d positions
clear all;
close all;
%
N=input('N = ');
seed=input('Random number seed = ');
rng(seed)
pos=rand(3,N);
tic
%%
match = wrapdist(pos);
%%
timetaken=toc;
disp(['Elapsed time = ',num2str(timetaken)])

% generate filename from N and seed
filename=['neigh' num2str(N) '_' num2str(seed)];
% if a file with this name already exists read in the nearest neighbour
% list found before and compare this to the current list of neighbours,
% else save the neighbour list to disk for future reference
if exist(filename,'file')==2
    fid=fopen(filename,'r');
    matchold=fscanf(fid,'%8i',N);
    fclose(fid);
if (matchold'==match) 
    disp('Checked match')
else
    disp('Failed match')
end
else
    disp('Saving neighbour list to disk')
    fid=fopen(filename,'w');
    fprintf(fid,'%8i \n',match);
    fclose(fid);
end