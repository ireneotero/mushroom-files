clear all
clc

% create txt file with sorted structures (by frequency)
% compute the hystogram of structure frequencies.

load MUSHROOM2D_SORTED_SOLUTIONS1

figure(1)
histogram(label_int,count,'BinMethod','integers')

[nn,edges,binx] = histcounts(label_int,count);  %%nn(553) frequency of structure 553

[sorted,idx] = sort(nn);

fid1 = fopen('Frequency_of_structures.txt','w');



for ii=max(size(idx)):-1:1
    fprintf(fid1, 'struct %d:   %d repeats,  topology %s\n', idx(ii),nn(idx(ii)),labelc{idx(ii)});
end


fclose(fid1)

save MUSHROOM2D_SORTED_SOLUTIONS2 idx  


 