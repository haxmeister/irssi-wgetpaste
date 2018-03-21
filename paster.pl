#!/usr/bin/env perl

use strict;
use warnings;
use Irssi;
use vars qw($VERSION %IRSSI);

$VERSION = '1.00';
%IRSSI = (
    authors     => 'Joshua S. Day (haxmeister)',
    contact     => 'haxmeister@hotmail.com',
    name        => 'irssi paster',
    description => 'This script allows ' .
                   'you to paste a file using wgetpaste ' .
                   'and post the link using a command.',
    license     => 'MIT',
);



Irssi::command_bind paste => \&paste;

sub paste {
    my ($data, $server, $witem) = @_;
        # does wgetpaste exist?
    if (-e "/usr/bin/wgetpaste"){

                # did the user send data to the function?
                if ($data){

                        # does the file the user sent actually exist? does it contain something?
                        if((-e $data) and (-s $data)){

                                # sending the text to wgetpaste
                                my $paste_string = "wgetpaste $data";
                                chomp $paste_string;

                                # posting the output into the chat channel
                                my $link = `$paste_string`;
                                chomp $link;
                                $witem->command( "say $link");
                        }
                        else{

                                # the file the user sent doesn't actually exist or perl doesn't see it
                                $witem->print("File is empty or does not exist --> $data");
                        }
                }
                else{

                        # The user forgot to send an actual string to send to paste
                        $witem->print( "no file given\nUsage: //paste <//somefolder//somefile>");
                }
        }
        else{

                # wgetpaste was not found at /usr/bin/wgetpaste
                $witem->print( "It appears wgetpaste is not installed on your system!");
        }
}
