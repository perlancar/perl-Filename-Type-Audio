package Filename::Audio;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict;
use warnings;

use Exporter qw(import);
our @EXPORT_OK = qw(check_audio_filename);

# sorted by length then asciibetical
our $STR_RE = "mpega|aifc|aiff|flac|midi|mpga|opus|aif|amr|awb|axa|csd|gsm|kar|m3u|m4a|mid|mp2|mp3|oga|ogg|orc|pls|ram|sco|sd2|sid|snd|spx|wav|wax|wma|au|ra|rm"; # STR_RE
our $RE = qr(\.(?:$STR_RE)\z)i;

our %SPEC;

$SPEC{check_audio_filename} = {
    v => 1.1,
    summary => 'Check whether filename indicates being an audio file',
    description => <<'_',


_
    args => {
        filename => {
            schema => 'filename*',
            req => 1,
            pos => 0,
        },
        # XXX recurse?
        #ci => {
        #    summary => 'Whether to match case-insensitively',
        #    schema  => 'bool',
        #    default => 1,
        #},
    },
    result_naked => 1,
    result => {
        schema => ['any*', of=>['bool*', 'hash*']],
        description => <<'_',

Return false if no archive suffixes detected. Otherwise return a hash of
information.

_
    },
    examples => [
        {
            args => {filename => 'foo.txt'},
            naked_result => 0,
        },
        {
            args => {filename => 'foo.mp4'},
            naked_result => 0,
        },
        {
            args => {filename => 'foo.wav'},
            naked_result => {},
        },
        {
            args => {filename => 'foo.MP3'},
            naked_result => {},
        },
    ],
};
sub check_audio_filename {
    my %args = @_;

    $args{filename} =~ $RE ? {} : 0;
}

1;
# ABSTRACT:

=head1 SYNOPSIS

 use Filename::Audio qw(check_audio_filename);
 my $res = check_audio_filename(filename => "foo.mp3");
 if ($res) {
     printf "File is audio";
 } else {
     print "File is not audio\n";
 }


=head1 DESCRIPTION


=head1 SEE ALSO

L<Filename::Video>

L<Filename::Image>

L<Filename::Ebook>

L<Filename::Media>

Other Filename::*

=cut
