use strict;
use warnings;

while (<>) {
    s/^(>.+?)\..+$/$1/g;;
    print;
}
