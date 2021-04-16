clear all
clc

% sort solutions obtained by optimization
% compute number of different structures


load mushroom2D
Results=Mushroom2D;

for ii=1:1:max(size(Results))      
    str_u(ii,:)=Results{ii}.xbest(12:15); % structure
    par_u(ii,:)=Results{ii}.xbest(1:11);  % parameters
    cost_u(ii)=Results{ii}.fbest;       
end




% sort by structure
[str, II] = sortrows(str_u);
par = par_u(II,:);
cost = cost_u(II);

% label
for jj=1:1:size(str,1)
    for ii=1:1:4
        if str(jj,ii)==-1
            eval(sprintf('s%d=''-'';',ii));
        elseif str(jj,ii) ==0
            eval(sprintf('s%d=''0'';',ii));
        else
            eval(sprintf('s%d=''+'';',ii));
        end
    end
    eval(sprintf('label{%d}=''%s%s%s%s'';',jj,s1,s2,s3,s4));
 end

 % count number of different structures
 count = 1;
 label_int(1) = 1;
 label{1};
% 
 labelc{1} = label{1};
for ii=2:1:size(str,1)
     if sum(str(ii,:) ~= str(ii-1,:))>0
         count = count + 1;
         label_int(ii) = count;
     else
         label_int(ii) = count;
     end
%     
     a = sprintf('index %d\n', ii);
     b = sprintf('label  %d\n', label_int(ii));
     c = sprintf('str %s\n', label{ii});
%     
%     
     labelc{count} = label{ii};
     labelc{count};
%     
%     
 end
% 
% % number of solutions and structures
 disp('NUMBER OF SOLUTIONS AND STRUCTURES')
 number_of_solutions = size(str,1)
 number_of_different_structures = count
% 
% 
for ii=1:1:number_of_solutions
    mush{ii}=[par(ii,:) str(ii,:)]
end

 save MUSHROOM2D_SORTED_SOLUTIONS1 count str par cost  label label_int mush labelc
