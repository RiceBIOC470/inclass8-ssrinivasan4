%AW: Looks good. see comment below. 0.95/1.

%Inclass assignment 8 - Sanjana Srinivasan

%Using the swalign function
% A. Create a random DNA sequence of length 100. 
dnaseq1=randseq(100);
% B. Create a second sequence from the first one by changing the middle 20 basepairs (at positions 41-60)
dnaseq2=strcat(dnaseq1(1:40), randseq(20), dnaseq1(61:end));
% C. run swalign on the two sequences with the default parameters

[def_score, def_alignment, def_start]=swalign(dnaseq1, dnaseq2);
% D. run swalign with much higher and lower values of the GapOpen parameter
% and explain the results. 
%AW: by default swalign uses the amino acid alphabet. set alphabet to 'nt' for dna sequences. -0.05.

[Dhigh_score, Dhigh_alignment, Dhigh_start]=swalign(dnaseq1, dnaseq2, 'GapOpen', 50);
[Dlow_score, Dlow_alignment, Dlow_start]=swalign(dnaseq1, dnaseq2, 'GapOpen', 2);

%when the gap penalty is increased, we can see differences in the alingment
%itself and the corresponding score. With a higher gap penalty, the aligment score 
%is the same as when the Default gap penalty of 8. This is because in
%both cases with a higher gap penalty, a mismatch is preferred over assigning gaps in order to
%get the maximum score. You can see that in both cases, the alignment is
%also the same.
%when the gap penalty is low and set to 2, the total alignment score
%increases. In addition to this, when looking at the alignment, you can see
%that there are more gaps assigned than mismatches compared to the default
%parameters. This is because with lower gap penalty, mismatches are less
%preferred so as to allow as many matches as possible to maximize the
%score.

% E. run swalign with a low value of GapOpen but a high value of ExtendGap,
% explain the result
[E_score, E_alignment, E_start]=swalign(dnaseq1, dnaseq2, 'GapOpen', 2, 'ExtendGap', 20);

%with a gap penalty, the optimal alignment will allow for regions of
%gaps with little consequence to the alignment score. However, when the
%extension penalty is high, there are less likely to be large regions of
%gaps as having multiple consecutive positions with gaps would have a large
%impact on the score. Here, with a low opening gap penalty, we see that
%there are quite a few regions with one gap assigned, however since the
%extension penalty is set so high, there are no regions were multiple gaps
%are assigned together.

% F. run swalign align with the default value of GapOpen and a low value
% of ExtendGap and explain the result. 
[F_score, F_alignment, F_start]=swalign(dnaseq1, dnaseq2, 'GapOpen', 8, 'ExtendGap', 1);

%With a higher opening gap penalty, and low extension penalty, the only way
%it would be "worth it to introduce a gap is if there are a series of gaps
%occuring together that would later allow for more matches. Looking at the
%alignment, we see that this is exacty the case. There are two regions of
%four gap positions each introduced in order to allow for all other
%positions to match. The total alignment score is lower than in cases where
%the opening gap penalty is lower.
