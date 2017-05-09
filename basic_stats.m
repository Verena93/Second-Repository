%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                     Matlab Workshop 01/30/17                            %
%           Basic Statistics, Sets, Sorting, and Indexing                 %
%         Presentors: Antonin Fourcade & Sebastian Schneider              %
%     Contact: antonin.fourcade@hotmail.fr & sebastian_sch@icloud.com     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Useful Info:
% Run selected code:  F9 (Windows)
% Run %%-Section:     Ctrl + Enter (Windows)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all; clc                                                             % clear workspace

%% 1 Basic Statistics
% Enter variables
x1 = input('Enter a 5 element vector\n')
A = input('Enter a 2x2 matrix\n');

%% 1.1 MIN AND MAX COMMAND
min(x1);
fprintf('The minimum of the vector is %d\n',min(x1));
max(x1);
fprintf('The maximum of the vector is %d\n',max(x1));

% To know the index of min/max values in the vector
[minval, minind] = min(x1);
[maxval, maxind] = max(x1);
fprintf('The minimum of the vector is %d at the position %d\n',minval, minind);
fprintf('The maximum of the vector is %d at the position %d\n',maxval, maxind);

%% 1.2 MEAN COMMAND %%
mean(x1);                                                                  % Mean of  a vector
fprintf('The mean of the vector is %d\n',mean(x1));

mean(A);                                                                   % For a matrix, the mean function operates columnwise
fprintf('The mean of each column of the matrix is %d\n',mean(x1));

%% 1.3 VARIANCE %%
var(x1);
fprintf('The variance of the vector is %d\n',var(x1));                     % For a vector

var(A);
fprintf('The variance of the matrix is %d\n',var(x1));                     % For a matrix

%% 1.4 STANDARD DEVIATION %%
std(x1);
fprintf('The standard deviation of the vector is %d\n',std(x1));           % For a vector

std(A);
fprintf('The standard deviation of the matrix is %d\n',std(x1));           % For a matrix

%% 1.5 MODE %%                                                             % The mode of a data set is the value that appears most frequently
mode(x1);                                                                  % If there is more than one value with the same (highest) frequency, the smaller
fprintf('The mode of the vector is %d\n',mode(x1));                        % value is the mode.

mode(A);
fprintf('The mode of the matrix is %d and %d\n',mode(A));

%% 1.6 MEDIAN %%                                                           % The median is defined only for a data set that has been sorted first, meaning that
% Be sure the vector is sorted
x2 = sort(x1);

median(x2);                                                                % the values are in order.
fprintf('The median of the vector is %d\n',median(x2));

% Be sure the matrix is sorted
B = sort(A);

median(B);
fprintf('The median of the matrix is %d and %d\n',median(B));

clear all;                                                                 % clear workspace

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 2 Set Theory
x1 = [1 3 4 .2] ; x2 = [3 5 1 .6];                                         % create arbitrary variables we will be working with


%% 2.1 UNION %%
union(x1, x2)                                                              % default sorted ascending: union(x1,x2, 'sorted')
union(x1,x2, 'stable')                                                     % original order

%% 2.2 INTERSECT %%
intersect(x1, x2)

%% 2.3 DIFFERENCE %%                                                       % relative complement
setdiff(x1, x2)
setdiff(x2, x1)

%% 2.4 SETXOR %%                                                           % symmetric difference/disjunctive union
setxor(x1,x2) 

% What will happen (1)?
union(setxor(x1,x2), intersect(x1,x2)) == union(x1,x2)

%% 2.5 UNIQUE %%
unique([x1,1,1,1])                                                         % unique entries

% Example : 2 vectors without intersection
x3 = [1 2] 
x4 = [3 4]

% What will happen (2)?
unique(intersect(x3,x4))

clear x3 x4                                                                % tidy-up WS

%% 2.6 INDEXING WITH SET OPERATORS %%
intersect(x1, x2)
[outvec, index1, index2] = intersect(x1,x2)

x1(index1)                                                                 % indexing elements of x1 in intersect
x2(index2)                                                                 % indexing elements of x2 in intersect 

% What will happen (3)?
x1(index1)== x2(index2) 

%% 2.7 ELEMENT %%                       
ismember(x1, x2)                                                           % T/F if entries of x1 are elements of x2
ismember(x2, x1)

x1(ismember(x1,x2))                                                        % can be used for indexing
x2(ismember(x2,x1))

%% 2.8 SORTED? %%
issorted(x1)                                                               % T/F if sorted

i_x1_x2 = intersect(x1, x2)                                                
% what will happen? (4)
issorted(i_x1_x2)                                                          % see 2.1, 2.2
%
clear i_x1_x2                                                              % tidy-up





%% 3 Sorting %%
sort(x1)                                                                   % ascending default: sort(x1, 'ascend')
sort(x1, 'descend')

% what will happen? (5)
sort(sort(x1, 'descend'))

X = ([x1; x2; x1+x2])'                                                     % create matrix (1st col = x1 2nd col = x2 3rd col = x1+x2)
sort(X)                                                                    % sort by col. default: sort(X,2)
sort(X,2)                                                                  % sort by row.

%% Sort Strings
words = char('Hello', 'Howdy', 'Hi', 'Goodbye', 'Ciao')
sort(words)                                                                % sort by row default: sort(words,1)
sort(words,2)                                                              % by col

sort('HaAllo')                                                             % upper before low case letters

sortrows(words)                                                            % sort entire words



%% 3 Searching %%
% Searching means looking for a value (a key) in a list or in a vector

%% SEQUENTIAL SEARCH %%
% A sequential search is accomplished by looping through the vector element by element
% starting from the beginning, looking for the key. The index of the element in
% which the key is found is what is returned.

% Enter variables
vec = input('Enter a 5 element vector\n')
key = input('Enter the key to find\n')

% Smart sequential search; searches a vector for a key but ends when it is found
len = length(vec);
index = 0;
i = 1;
while i < len && vec(i) ~= key
    i = i + 1;
end
if vec(i) == key
    index = i;
end

% Display
if index == 0
    fprintf('The key is not in the vector\n');
else
    fprintf('The key is at the position %d\n',index);
end

%% BINARY SEARCH
% The binary search assumes that the vector has been sorted first. The algorithm is
% similar to the way it works when looking for a name in a phone directory
% (which is sorted alphabetically).

% To find the value of a key:
% Look at the element in the middle:
% If that is the key, the index has been found.
% If it is not the key, decide whether to search the elements before or after
% this location and adjust the range of values in which the search is taking
% place and start this process again.

% To implement this, we will use variables low and high to specify the range of values in
% which to search. To begin, the value of low will be 1, and the value of high will be the
% length of the vector. The variable mid will be the index of the element in the middle
% of the range from low to high. If the key is not found at mid, there are two possible
% ways to adjust the range. If the key is less than the value at mid, 
% we change high to mid – 1. If the key is greater than the value at mid, we change low to mid + 1

vec1 = sort(vec);
fprintf('The sorted vector is [%d %d %d %d %d]\n',vec1);
low = 1;
high = length(vec1);
outind = 0;
while low <= high && outind == 0
mid = floor((low + high)/2);
if vec1(mid) == key
    outind = mid;
elseif key < vec1(mid)
    high = mid - 1;
else
    low = mid + 1;
end
end

% Display
if outind == 0
    fprintf('The key is not in the vector\n');
else
    fprintf('The key is at the position %d\n',outind);
end

%% FIND FUNCTION
% searches a vector for a key and returns the position or an empty array if
% not found

ind = find(vec==key);
% Display
if isempty(ind)
    fprintf('The key is not in the vector\n');
else
    fprintf('The key is at the position %d\n',ind);
end