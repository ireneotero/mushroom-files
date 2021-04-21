clear all
clc

% sort solutions obtained by optimization
% compute number of different structures


load mushroom3D_1
load mushroom3D_2
load mushroom3D_3
load mushroom3D_4

for ii=1:1:2400
Results{ii}=Mushroom_1{ii};
end

for ii=2401:1:4800
Results{ii}=Mushroom_2{ii-2400};
end

for ii=4801:1:7200
Results{ii}=Mushroom_3{ii-4800};
end

for ii=7201:1:9620
Results{ii}=Mushroom_4{ii-7200};
end



for ii=1:1:max(size(Results))      
    str_u(ii,:)=Results{ii}.xbest(14:end); % structure
    par_u(ii,:)=Results{ii}.xbest(1:13);  % parameters
    cost_u(ii)=Results{ii}.fbest;       
end


% sort by structure
[str, II] = sortrows(str_u);
par = par_u(II,:);
cost = cost_u(II);

% label
for jj=1:1:size(str,1)
    for ii=1:1:9
        if str(jj,ii)==-1
            eval(sprintf('s%d=''-'';',ii));
        elseif str(jj,ii) ==0
            eval(sprintf('s%d=''0'';',ii));
        else
            eval(sprintf('s%d=''+'';',ii));
        end
    end
    eval(sprintf('label{%d}=''%s%s%s%s%s%s%s%s%s'';',jj,s1,s2,s3,s4,s5,s6,s7,s8,s9));
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
end


%  number of solutions and structures
 number_of_solutions = size(str,1);
 number_of_different_structures = count;
% 
% 
for ii=1:1:number_of_solutions
    mush{ii}=[par(ii,:) str(ii,:)];
end

 save MUSHROOM3D_SORTED_SOLUTIONS1 count str par cost  label label_int mush labelc
