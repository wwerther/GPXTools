#!/usr/bin/perl -w

use strict;

my $line;
while (<>) {
	$line.=$_;
}


$line =~ s/\r//sgi;
#
$line =~ s/<hints>(.*?)<\/hints>/<encoded_hints>$1<\/encoded_hints>/sgi;

$line =~ s/xmlns="http:\/\/www.topografix.com\/GPX\/1\/0/xmlns="http:\/\/www.topografix.com\/GPX\/1\/1/sgi;
$line =~ s/version="1\.0"/version="1.1"/sgi;
$line =~ s/xml version="1\.1"/xml version="1.0"/sgi;

$line =~ s/(<desc>(.*?)<\/time>)/<metadata>$1<\/metadata>/si;
$line =~ s/<cache id="(\d+)" status="Available">/<cache id="$1" available="True" archived="False" xmlns="http:\/\/www.groundspeak.com\/cache\/1\/0">/sgi;

$line =~ s/&lt;span.*?&gt;//sgi;
$line =~ s/&lt;\/span&gt;//sgi;
$line =~ s/&lt;img.*?&gt;//sgi;
$line =~ s/&lt;font.*?&gt;//sgi;
$line =~ s/&lt;\/font&gt;//sgi;
$line =~ s/&lt;p.*?&gt;//sgi;
$line =~ s/&lt;\/p&gt;//sgi;

$line =~ s/&amp;auml;/\xc3\xa4/sgi;
$line =~ s/&amp;uuml;/\xc3\xbc/sgi;
$line =~ s/&amp;ouml;/\xc3\xb6/sgi;
$line =~ s/&amp;szlig;/\xc3\x9f/sgi;
$line =~ s/&amp;Auml;/\xc3\x84/sgi;
$line =~ s/&amp;Uuml;/\xc3\x9c/sgi;
$line =~ s/&amp;ouml;/\xc3\x96/sgi;
$line =~ s/&amp;quot;/&quot;/sgi;
$line =~ s/&amp;amp;/&amp;/sgi;
$line =~ s/&amp;nbsp;/_/sgi;

print $line;
