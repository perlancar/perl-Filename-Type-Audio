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
our $STR_RE = join '|', qw(
                    mpega
                    aifc aiff flac midi mpga opus
                    aif amr awb axa csd gsm kar m3u m4a mid mp2 mp3 oga ogg orc pls ram sco sd2 sid snd spx wav wax wma
                    au rarm
                      );

our $RE = qr(\.(?:$STR_RE)\z)i;

sub check_audio_filename {
    my %args = @_;

    $args{filename} =~ $RE ? {} : 0;
}

1;
# ABSTRACT: Check whether filename indicates being an audio file

=head1 SYNOPSIS

 use Filename::Audio qw(check_audio_filename);
 my $res = check_audio_filename(filename => "foo.mp3");
 if ($res) {
     printf "File is audio";
 } else {
     print "File is not audio\n";
 }


=head1 DESCRIPTION


=head1 FUNCTIONS

=head2 check_audio_filename


=head1 SEE ALSO

L<Filename::Video>

L<Filename::Image>

L<Filename::Media>

=cut
