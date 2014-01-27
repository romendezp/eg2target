#!/usr/bin/perl -w
# EG2 Geometry adapted from GEANT to GEMC by Rodrigo Mendez

use strict;

use lib ("$ENV{GEMC}/database_io");
use geo;
use geo qw($pi);

my $envelope = 'mygeo_eg2';
my $file     = 'mygeo_eg2.txt';

my $wireon = 1;

my $n1 = 1;
my $n2 = 2;

my $rmin      = 1;
my $rmax      = 1000000;

my %detector = ();    # hash (map) that defines the gemc detector
$detector{"rmin"} = $rmin;
$detector{"rmax"} = $rmax;

use Getopt::Long;
use Math::Trig;

# Mother Volume
sub make_mother
{
 $detector{"name"}        = "VOLM";
 $detector{"mother"}      = "root";
 $detector{"description"} = "mother volume";
 $detector{"pos"}         = "0*cm 0*cm -25.316*cm";
 $detector{"rotation"}    = "0*deg 0*deg 0*deg";
 $detector{"color"}       = "ff0000";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 12*cm 25*cm 0*deg 360*deg";
 $detector{"material"}    = "Vacuum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = "no";
 $detector{"style"}       = 1;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_mother();

sub make_VCYL
{
 $detector{"name"}        = "VCYL";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 0*cm -9*cm";
 $detector{"rotation"}    = "0*deg 0*deg 0*deg";
 $detector{"color"}       = "00ffff";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "9*cm 10.016*cm 9*cm 0*deg 360*deg";
 $detector{"material"}    = "LastaFoam";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VCYL();

sub make_VSPH
{
 $detector{"name"}        = "VSPH";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 0*cm 0*cm";
 $detector{"rotation"}    = "-90*deg -90*deg 0*deg";
 $detector{"color"}       = "ffffff";
 $detector{"type"}        = "Sphere";

 $detector{"dimensions"}  = "9*cm 9.953*cm 0*deg 180*deg 0*deg 180*deg";
 $detector{"material"}    = "LastaFoam";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "FLUX";
 $detector{"hit_type"}    = "FLUX";
 $detector{"identifiers"} = "id manual 1";

 print_det(\%detector, $file);
}

make_VSPH();

sub make_VEXI
{
 $detector{"name"}        = "VEXI";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 0*cm 16.25*cm";
 $detector{"rotation"}    = "0*deg 0*deg 0*deg";
 $detector{"color"}       = "ffffff";
 $detector{"type"}        = "Cons";

 $detector{"dimensions"}  = "0.673*cm 0.757*cm 1.27*cm 1.354*cm 7.25*cm 0*deg 360*deg";
 $detector{"material"}    = "CarbonFiber";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VEXI();

sub make_VEXW
{
 $detector{"name"}        = "VEXW";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 0*cm 23.5*cm";
 $detector{"rotation"}    = "0*deg 0*deg 0*deg";
 $detector{"color"}       = "ffffff";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 1.27*cm 0.00355*cm 0*deg 360*deg";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VEXW();

sub make_VAR1_1
{
 $detector{"name"}        = "VAR1_1";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 8.396*cm -13.263*cm";
 $detector{"rotation"}    = "0*deg 0*deg 0*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.3175*cm 0.49403*cm 5.82422*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VAR1_1();

sub make_VAR1_2
{
 $detector{"name"}        = "VAR1_2";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm -8.396*cm -13.263*cm";
 $detector{"rotation"}    = "0*deg 0*deg 0*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.3175*cm 0.49403*cm 5.82422*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VAR1_2();

sub make_VAR1_3
{
 $detector{"name"}        = "VAR1_3";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "7.27094*cm 4.198*cm -13.263*cm";
 $detector{"rotation"}    = "0*deg 0*deg 60*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.3175*cm 0.49403*cm 5.82422*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VAR1_3();

sub make_VAR1_4
{
 $detector{"name"}        = "VAR1_4";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "7.27094*cm -4.198*cm -13.263*cm";
 $detector{"rotation"}    = "0*deg 0*deg -60*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.3175*cm 0.49403*cm 5.82422*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VAR1_4();

sub make_VAR1_5
{
 $detector{"name"}        = "VAR1_5";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-7.27094*cm -4.198*cm -13.263*cm";
 $detector{"rotation"}    = "0*deg 0*deg 60*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.3175*cm 0.49403*cm 5.82422*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VAR1_5();

sub make_VAR1_6
{
 $detector{"name"}        = "VAR1_6";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-7.27094*cm 4.198*cm -13.263*cm";
 $detector{"rotation"}    = "0*deg 0*deg -60*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.3175*cm 0.49403*cm 5.82422*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VAR1_6();

sub make_VAR2_1
{
 $detector{"name"}        = "VAR2_1";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 7.873*cm -8.148*cm";
 $detector{"rotation"}    = "-17*deg 0*deg 0*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.3175*cm 0.54483*cm 1.78206*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VAR2_1();

sub make_VAR2_2
{
 $detector{"name"}        = "VAR2_2";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm -7.873*cm -8.148*cm";
 $detector{"rotation"}    = "17*deg 0*deg 0*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.3175*cm 0.54483*cm 1.78206*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VAR2_2();

sub make_VAR2_3
{
 $detector{"name"}        = "VAR2_3";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "6.81802*cm 3.9365*cm -8.148*cm";
 $detector{"rotation"}    = "-8.69126*deg 14.667*deg 58.8793*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.3175*cm 0.54483*cm 1.78206*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VAR2_3();

sub make_VAR2_4
{
 $detector{"name"}        = "VAR2_4";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "6.81802*cm -3.9365*cm -8.148*cm";
 $detector{"rotation"}    = "8.69126*deg 14.667*deg -58.8793*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.3175*cm 0.54483*cm 1.78206*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VAR2_4();

sub make_VAR2_5
{
 $detector{"name"}        = "VAR2_5";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-6.81802*cm -3.9365*cm -8.148*cm";
 $detector{"rotation"}    = "8.69126*deg -14.667*deg 58.8793*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.3175*cm 0.54483*cm 1.78206*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VAR2_5();

sub make_VAR2_6
{
 $detector{"name"}        = "VAR2_6";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-6.81802*cm 3.9365*cm -8.148*cm";
 $detector{"rotation"}    = "-8.69126*deg -14.667*deg -58.8793*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.3175*cm 0.54483*cm 1.78206*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VAR2_6();

sub make_VAR3_1
{
 $detector{"name"}        = "VAR3_1";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 6.923*cm -2.086*cm";
 $detector{"rotation"}    = "-17*deg 0*deg 0*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.3175*cm 0.3175*cm 5.69329*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VAR3_1();

sub make_VAR3_2
{
 $detector{"name"}        = "VAR3_2";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm -6.923*cm -2.086*cm";
 $detector{"rotation"}    = "17*deg 0*deg 0*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.3175*cm 0.3175*cm 5.69329*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VAR3_2();

sub make_VAR3_3
{
 $detector{"name"}        = "VAR3_3";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "5.99632*cm 3.4615*cm -2.086*cm";
 $detector{"rotation"}    = "-8.69126*deg 14.667*deg 58.6793*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.3175*cm 0.3175*cm 5.69329*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VAR3_3();

sub make_VAR3_4
{
 $detector{"name"}        = "VAR3_4";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "5.99632*cm -3.4615*cm -2.086*cm";
 $detector{"rotation"}    = "8.69126*deg 14.667*deg -58.6793*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.3175*cm 0.3175*cm 5.69329*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VAR3_4();

sub make_VAR3_5
{
 $detector{"name"}        = "VAR3_5";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-5.99632*cm -3.4615*cm -2.086*cm";
 $detector{"rotation"}    = "8.69126*deg -14.667*deg 58.6793*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.3175*cm 0.3175*cm 5.69329*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VAR3_5();

sub make_VAR3_6
{
 $detector{"name"}        = "VAR3_6";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-5.99632*cm 3.4615*cm -2.086*cm";
 $detector{"rotation"}    = "-8.69126*deg -14.667*deg -58.6793*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.3175*cm 0.3175*cm 5.69329*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VAR3_6();

sub make_VAR4_1
{
 $detector{"name"}        = "VAR4_1";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 5.3511*cm 1.56081*cm";
 $detector{"rotation"}    = "-17*deg 0*deg 0*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.3175*cm 0.11938*cm 1.74625*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VAR4_1();

sub make_VAR4_2
{
 $detector{"name"}        = "VAR4_2";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm -5.3511*cm 1.56081*cm";
 $detector{"rotation"}    = "17*deg 0*deg 0*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.3175*cm 0.11938*cm 1.74625*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VAR4_2();

sub make_VAR4_3
{
 $detector{"name"}        = "VAR4_3";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "4.63605*cm 2.67555*cm 1.56081*cm";
 $detector{"rotation"}    = "-8.69126*deg 14.667*deg 58.6793*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.3175*cm 0.11938*cm 1.74625*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VAR4_3();

sub make_VAR4_4
{
 $detector{"name"}        = "VAR4_4";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "4.63605*cm -2.67555*cm 1.56081*cm";
 $detector{"rotation"}    = "8.69126*deg 14.667*deg -58.6793*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.3175*cm 0.11938*cm 1.74625*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VAR4_4();

sub make_VAR4_5
{
 $detector{"name"}        = "VAR4_5";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-4.63605*cm -2.67555*cm 1.56081*cm";
 $detector{"rotation"}    = "8.69126*deg -14.667*deg 58.6793*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.3175*cm 0.11938*cm 1.74625*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VAR4_5();

sub make_VAR4_6
{
 $detector{"name"}        = "VAR4_6";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-4.63605*cm 2.67555*cm 1.56081*cm";
 $detector{"rotation"}    = "-8.69126*deg -14.667*deg -58.6793*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.3175*cm 0.11938*cm 1.74625*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VAR4_6();

sub make_VAR5_1
{
 $detector{"name"}        = "VAR5_1";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 4.89566*cm 1.42156*cm";
 $detector{"rotation"}    = "-17*deg 0*deg 0*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.3175*cm 0.35687*cm 0.9525*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VAR5_1();

sub make_VAR5_2
{
 $detector{"name"}        = "VAR5_2";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm -4.89566*cm 1.42156*cm";
 $detector{"rotation"}    = "17*deg 0*deg 0*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.3175*cm 0.35687*cm 0.9525*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VAR5_2();

sub make_VAR5_3
{
 $detector{"name"}        = "VAR5_3";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "4.23964*cm 2.44783*cm 1.42156*cm";
 $detector{"rotation"}    = "-8.69126*deg 14.667*deg 58.8793*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.3175*cm 0.35687*cm 0.9525*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VAR5_3();

sub make_VAR5_4
{
 $detector{"name"}        = "VAR5_4";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "4.23964*cm -2.44783*cm 1.42156*cm";
 $detector{"rotation"}    = "8.69126*deg 14.667*deg -58.8793*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.3175*cm 0.35687*cm 0.9525*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VAR5_4();

sub make_VAR5_5
{
 $detector{"name"}        = "VAR5_5";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-4.23964*cm -2.44783*cm 1.42156*cm";
 $detector{"rotation"}    = "8.69126*deg -14.667*deg 58.8793*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.3175*cm 0.35687*cm 0.9525*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VAR5_5();

sub make_VAR5_6
{
 $detector{"name"}        = "VAR5_6";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-4.23964*cm 2.44783*cm 1.42156*cm";
 $detector{"rotation"}    = "-8.69126*deg -14.667*deg -58.8793*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.3175*cm 0.35687*cm 0.9525*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VAR5_6();

sub make_VAR6_1
{
 $detector{"name"}        = "VAR6_1";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 4.25076*cm 1.22437*cm";
 $detector{"rotation"}    = "73*deg 0*deg -90*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Trd";

 $detector{"dimensions"}  = "0.3175*cm 0.9525*cm 0.3175*cm 0.3175*cm 0.3175*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VAR6_1();

sub make_VAR6_2
{
 $detector{"name"}        = "VAR6_2";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm -4.25076*cm 1.22437*cm";
 $detector{"rotation"}    = "-73*deg 0*deg -90*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Trd";

 $detector{"dimensions"}  = "0.3175*cm 0.9525*cm 0.3175*cm 0.3175*cm 0.3175*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VAR6_2();

sub make_VAR6_3
{
 $detector{"name"}        = "VAR6_3";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "3.68116*cm 2.12538*cm 1.22437*cm";
 $detector{"rotation"}    = "58.5558*deg -55.9127*deg -63.1422*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Trd";

 $detector{"dimensions"}  = "0.3175*cm 0.9525*cm 0.3175*cm 0.3175*cm 0.3175*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VAR6_3();

sub make_VAR6_4
{
 $detector{"name"}        = "VAR6_4";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "3.68116*cm -2.12538*cm 1.22437*cm";
 $detector{"rotation"}    = "-58.5558*deg -55.9127*deg 63.1422*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Trd";

 $detector{"dimensions"}  = "0.3175*cm 0.9525*cm 0.3175*cm 0.3175*cm 0.3175*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VAR6_4();

sub make_VAR6_5
{
 $detector{"name"}        = "VAR6_5";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-3.68116*cm -2.12538*cm 1.22437*cm";
 $detector{"rotation"}    = "-58.5558*deg 55.9127*deg 116.858*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Trd";

 $detector{"dimensions"}  = "0.3175*cm 0.9525*cm 0.3175*cm 0.3175*cm 0.3175*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VAR6_5();

sub make_VAR6_6
{
 $detector{"name"}        = "VAR6_6";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-3.68116*cm 2.12538*cm 1.22437*cm";
 $detector{"rotation"}    = "58.5558*deg 55.9127*deg -116.858*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Trd";

 $detector{"dimensions"}  = "0.3175*cm 0.9525*cm 0.3175*cm 0.3175*cm 0.3175*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VAR6_6();

sub make_WIRE_1
{
 $detector{"name"}        = "WIRE_1";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 5.75216*cm -4.02422*cm";
 $detector{"rotation"}    = "-27.12*deg 0*deg 0*deg";
 $detector{"color"}       = "00ff00";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.0795*cm 2.79*cm 0*deg 360*deg";
 $detector{"material"}    = "Iron";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 1){
	make_WIRE_1();
}

sub make_WIRE_2
{
 $detector{"name"}        = "WIRE_2";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm -5.75216*cm -4.02422*cm";
 $detector{"rotation"}    = "27.12*deg 0*deg 0*deg";
 $detector{"color"}       = "00ff00";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.0795*cm 2.79*cm 0*deg 360*deg";
 $detector{"material"}    = "Iron";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 2){
	make_WIRE_2();
}

sub make_WIRE_3
{
 $detector{"name"}        = "WIRE_3";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "4.98137*cm 2.87608*cm -4.02422*cm";
 $detector{"rotation"}    = "-14.3638*deg 23.2524*deg 57.0298*deg";
 $detector{"color"}       = "00ff00";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.0795*cm 2.79*cm 0*deg 360*deg";
 $detector{"material"}    = "Iron";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 3){
	make_WIRE_3();
}
sub make_WIRE_4
{
 $detector{"name"}        = "WIRE_4";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "4.98137*cm -2.87608*cm -4.02422*cm";
 $detector{"rotation"}    = "14.3638*deg 23.2524*deg -57.0298*deg";
 $detector{"color"}       = "00ff00";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.0795*cm 2.79*cm 0*deg 360*deg";
 $detector{"material"}    = "Iron";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 4){
	make_WIRE_4();
}

sub make_WIRE_5
{
 $detector{"name"}        = "WIRE_5";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-4.98137*cm -2.87608*cm -4.02422*cm";
 $detector{"rotation"}    = "14.3638*deg -23.2524*deg 57.0298*deg";
 $detector{"color"}       = "00ff00";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.0795*cm 2.79*cm 0*deg 360*deg";
 $detector{"material"}    = "Iron";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 5){
	make_WIRE_5();
}

sub make_WIRE_6
{
 $detector{"name"}        = "WIRE_6";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-4.98137*cm 2.87608*cm -4.02422*cm";
 $detector{"rotation"}    = "-14.3638*deg -23.2524*deg -57.0298*deg";
 $detector{"color"}       = "00ff00";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.0795*cm 2.79*cm 0*deg 360*deg";
 $detector{"material"}    = "Iron";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 6){
	make_WIRE_6();
}

sub make_WION_1
{
 $detector{"name"}        = "WION_1";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 6.32662*cm -5.16237*cm";
 $detector{"rotation"}    = "-25.96*deg 0*deg 0*deg";
 $detector{"color"}       = "00ff00";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.0795*cm 1.566*cm 0*deg 360*deg";
 $detector{"material"}    = "Iron";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 1){
	make_WION_1();
}

sub make_WION_2
{
 $detector{"name"}        = "WION_2";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm -6.32662*cm -5.16237*cm";
 $detector{"rotation"}    = "25.96*deg 0*deg -180*deg";
 $detector{"color"}       = "00ff00";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.0795*cm 1.566*cm 0*deg 360*deg";
 $detector{"material"}    = "Iron";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 2){
	make_WION_2();
}

sub make_WION_3
{
 $detector{"name"}        = "WION_3";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "5.47885*cm 3.16331*cm -5.16237*cm";
 $detector{"rotation"}    = "-13.6816*deg 22.2778*deg 57.2938*deg";
 $detector{"color"}       = "00ff00";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.0795*cm 1.566*cm 0*deg 360*deg";
 $detector{"material"}    = "Iron";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 3){
	make_WION_3();
}

sub make_WION_4
{
 $detector{"name"}        = "WION_4";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "5.47885*cm -3.16331*cm -5.16237*cm";
 $detector{"rotation"}    = "13.6816*deg 22.2778*deg 122.706*deg";
 $detector{"color"}       = "00ff00";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.0795*cm 1.566*cm 0*deg 360*deg";
 $detector{"material"}    = "Iron";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 4){
	make_WION_4();
}

sub make_WION_5
{
 $detector{"name"}        = "WION_5";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-5.47885*cm -3.16331*cm -5.16237*cm";
 $detector{"rotation"}    = "13.6816*deg -22.2778*deg -122.706*deg";
 $detector{"color"}       = "00ff00";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.0795*cm 1.566*cm 0*deg 360*deg";
 $detector{"material"}    = "Iron";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 5){
	make_WION_5();
}

sub make_WION_6
{
 $detector{"name"}        = "WION_6";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-5.47885*cm 3.16331*cm -5.16237*cm";
 $detector{"rotation"}    = "-13.6816*deg -22.2778*deg -57.2938*deg";
 $detector{"color"}       = "00ff00";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.0795*cm 1.566*cm 0*deg 360*deg";
 $detector{"material"}    = "Iron";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 6){
	make_WION_6();
}

sub make_VAR7_1
{
 $detector{"name"}        = "VAR7_1";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 3.677*cm 1.56573*cm";
 $detector{"rotation"}    = "9.5*deg 0*deg 180*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.1143*cm 0.87376*cm 0.47543*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 1){
	make_VAR7_1();
}

sub make_VAR7_2
{
 $detector{"name"}        = "VAR7_2";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm -3.677*cm 1.56573*cm";
 $detector{"rotation"}    = "-9.5*deg 0*deg 0*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.1143*cm 0.87376*cm 0.47543*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 2){
	make_VAR7_2();
}

sub make_VAR7_3
{
 $detector{"name"}        = "VAR7_3";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "3.18428*cm 1.8385*cm 1.56573*cm";
 $detector{"rotation"}    = "4.78287*deg -8.21774*deg -120.344*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.1143*cm 0.87376*cm 0.47543*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 3){
	make_VAR7_3();
}

sub make_VAR7_4
{
 $detector{"name"}        = "VAR7_4";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "3.18428*cm -1.8385*cm 1.56573*cm";
 $detector{"rotation"}    = "-4.78287*deg -8.21774*deg -59.6562*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.1143*cm 0.87376*cm 0.47543*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 4){
	make_VAR7_4();
}

sub make_VAR7_5
{
 $detector{"name"}        = "VAR7_5";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-3.18428*cm -1.8385*cm 1.56573*cm";
 $detector{"rotation"}    = "-4.78287*deg 8.21774*deg 59.6562*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.1143*cm 0.87376*cm 0.47543*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 5){
	make_VAR7_5();
}

sub make_VAR7_6
{
 $detector{"name"}        = "VAR7_6";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-3.18428*cm 1.8385*cm 1.56573*cm";
 $detector{"rotation"}    = "4.78287*deg 8.21774*deg 120.344*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.1143*cm 0.87376*cm 0.47543*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 6){
	make_VAR7_6();
}

sub make_VAR7ON_1
{
 $detector{"name"}        = "VAR7ON_1";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 4.24713*cm 0.597949*cm";
 $detector{"rotation"}    = "-70.5*deg 0*deg -180*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.1143*cm 0.87376*cm 0.47543*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 1){
	make_VAR7ON_1();
}

sub make_VAR7ON_2
{
 $detector{"name"}        = "VAR7ON_2";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm -4.24713*cm 0.597949*cm";
 $detector{"rotation"}    = "70.5*deg 0*deg 0*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.1143*cm 0.87376*cm 0.47543*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 2){
	make_VAR7ON_2();
}

sub make_VAR7ON_3
{
 $detector{"name"}        = "VAR7ON_3";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "3.67801*cm 2.12356*cm 0.597949*cm";
 $detector{"rotation"}    = "-54.6925*deg 54.7212*deg -149.965*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.1143*cm 0.87376*cm 0.47543*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 3){
	make_VAR7ON_3();
}

sub make_VAR7ON_4
{
 $detector{"name"}        = "VAR7ON_4";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "3.67801*cm -2.12356*cm 0.597949*cm";
 $detector{"rotation"}    = "54.6925*deg 54.7212*deg -30.0352*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.1143*cm 0.87376*cm 0.47543*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 4){
	make_VAR7ON_4();
}

sub make_VAR7ON_5
{
 $detector{"name"}        = "VAR7ON_5";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-3.67801*cm -2.12356*cm 0.597949*cm";
 $detector{"rotation"}    = "54.6925*deg -54.7212*deg 30.0352*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.1143*cm 0.87376*cm 0.47543*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 5){
	make_VAR7ON_5();
}

sub make_VAR7ON_6
{
 $detector{"name"}        = "VAR7ON_6";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-3.67801*cm 2.12356*cm 0.597949*cm";
 $detector{"rotation"}    = "-54.6925*deg -54.7212*deg 149.965*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.1143*cm 0.87376*cm 0.47543*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 6){
	make_VAR7ON_6();
}

sub make_VAR8_1
{
 $detector{"name"}        = "VAR8_1";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 2.81521*cm 1.7099*cm";
 $detector{"rotation"}    = "0*deg 90*deg 0*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.4754*cm 0.1143*cm 0*deg 360*deg";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 1){
	make_VAR8_1();
}

sub make_VAR8_2
{
 $detector{"name"}        = "VAR8_2";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm -2.81521*cm 1.7099*cm";
 $detector{"rotation"}    = "180*deg -90*deg 0*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.4754*cm 0.1143*cm 0*deg 360*deg";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 2){
	make_VAR8_2();
}

sub make_VAR8_3
{
 $detector{"name"}        = "VAR8_3";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "2.43797*cm 1.40761*cm 1.7099*cm";
 $detector{"rotation"}    = "90*deg 30*deg 90*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.4754*cm 0.1143*cm 0*deg 360*deg";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 3){
	make_VAR8_3();
}

sub make_VAR8_4
{
 $detector{"name"}        = "VAR8_4";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "2.43797*cm -1.40761*cm 1.7099*cm";
 $detector{"rotation"}    = "90*deg -30*deg 90*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.4754*cm 0.1143*cm 0*deg 360*deg";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 4){
	make_VAR8_4();
}

sub make_VAR8_5
{
 $detector{"name"}        = "VAR8_5";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-2.43797*cm -1.40761*cm 1.7099*cm";
 $detector{"rotation"}    = "-90*deg -30*deg -90*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.4754*cm 0.1143*cm 0*deg 360*deg";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 5){
	make_VAR8_5();
}

sub make_VAR8_6
{
 $detector{"name"}        = "VAR8_6";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-2.43797*cm 1.40761*cm 1.7099*cm";
 $detector{"rotation"}    = "-90*deg 30*deg -90*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.4754*cm 0.1143*cm 0*deg 360*deg";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 6){
	make_VAR8_6();
}

sub make_VAR8ON_1
{
 $detector{"name"}        = "VAR8ON_1";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 3.95547*cm -0.225657*cm";
 $detector{"rotation"}    = "0*deg 90*deg 0*deg";
 $detector{"color"}       = "ff0000";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.4754*cm 0.1143*cm 0*deg 360*deg";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 1){
	make_VAR8ON_1();
}

sub make_VAR8ON_2
{
 $detector{"name"}        = "VAR8ON_2";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm -3.95547*cm -0.225657*cm";
 $detector{"rotation"}    = "180*deg -90*deg 0*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.4754*cm 0.1143*cm 0*deg 360*deg";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 2){
	make_VAR8ON_2();
}

sub make_VAR8ON_3
{
 $detector{"name"}        = "VAR8ON_3";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "3.42543*cm 1.97773*cm -0.225657*cm";
 $detector{"rotation"}    = "90*deg 30*deg 90*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.4754*cm 0.1143*cm 0*deg 360*deg";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 3){
	make_VAR8ON_3();
}

sub make_VAR8ON_4
{
 $detector{"name"}        = "VAR8ON_4";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "3.42543*cm -1.97773*cm -0.225657*cm";
 $detector{"rotation"}    = "90*deg -30*deg 90*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.4754*cm 0.1143*cm 0*deg 360*deg";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 4){
	make_VAR8ON_4();
}

sub make_VAR8ON_5
{
 $detector{"name"}        = "VAR8ON_5";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-3.42543*cm -1.97773*cm -0.225657*cm";
 $detector{"rotation"}    = "-90*deg -30*deg -90*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.4754*cm 0.1143*cm 0*deg 360*deg";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 5){
	make_VAR8ON_5();
}

sub make_VAR8ON_6
{
 $detector{"name"}        = "VAR8ON_6";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-3.42543*cm 1.97773*cm -0.225657*cm";
 $detector{"rotation"}    = "-90*deg 30*deg -90*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.4754*cm 0.1143*cm 0*deg 360*deg";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 6){
	make_VAR8ON_6();
}

sub make_VAR9_1
{
 $detector{"name"}        = "VAR9_1";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 2.96035*cm 1.42653*cm";
 $detector{"rotation"}    = "-27.12*deg 0*deg 0*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.15875*cm 0.3175*cm 0.79375*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 1){
	make_VAR9_1();
}

sub make_VAR9_2
{
 $detector{"name"}        = "VAR9_2";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm -2.96035*cm 1.42653*cm";
 $detector{"rotation"}    = "27.12*deg 0*deg 0*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.15875*cm 0.3175*cm 0.79375*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 2){
	make_VAR9_2();
}

sub make_VAR9_3
{
 $detector{"name"}        = "VAR9_3";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "2.56366*cm 1.48017*cm 1.42653*cm";
 $detector{"rotation"}    = "-14.3638*deg 23.2524*deg 57.0298*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.15875*cm 0.3175*cm 0.79375*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 3){
	make_VAR9_3();
}

sub make_VAR9_4
{
 $detector{"name"}        = "VAR9_4";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "2.56366*cm -1.48017*cm 1.42653*cm";
 $detector{"rotation"}    = "14.3638*deg 23.2524*deg -57.0298*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.15875*cm 0.3175*cm 0.79375*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 4){
	make_VAR9_4();
}

sub make_VAR9_5
{
 $detector{"name"}        = "VAR9_5";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-2.56366*cm -1.48017*cm 1.42653*cm";
 $detector{"rotation"}    = "14.3638*deg -23.2524*deg 57.0298*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.15875*cm 0.3175*cm 0.79375*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 5){
	make_VAR9_5();
}

sub make_VAR9_6
{
 $detector{"name"}        = "VAR9_6";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-2.56366*cm 1.48017*cm 1.42653*cm";
 $detector{"rotation"}    = "-14.3638*deg -23.2524*deg -57.0298*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.15875*cm 0.3175*cm 0.79375*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 6){
	make_VAR9_6();
}

sub make_VAR9ON_1
{
 $detector{"name"}        = "VAR9ON_1";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 4.182*cm -0.757*cm";
 $detector{"rotation"}    = "-25.96*deg 0*deg 0*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.15875*cm 0.3175*cm 0.79375*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 1){
	make_VAR9ON_1();
}

sub make_VAR9ON_2
{
 $detector{"name"}        = "VAR9ON_2";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm -4.182*cm -0.757*cm";
 $detector{"rotation"}    = "25.96*deg 0*deg -180*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.15875*cm 0.3175*cm 0.79375*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 2){
	make_VAR9ON_2();
}

sub make_VAR9ON_3
{
 $detector{"name"}        = "VAR9ON_3";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "3.62161*cm 2.091*cm -0.757*cm";
 $detector{"rotation"}    = "-13.6816*deg 22.2778*deg 57.2938*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.15875*cm 0.3175*cm 0.79375*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 3){
	make_VAR9ON_3();
}

sub make_VAR9ON_4
{
 $detector{"name"}        = "VAR9ON_4";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "3.62161*cm -2.091*cm -0.757*cm";
 $detector{"rotation"}    = "13.6816*deg 22.2778*deg 122.706*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.15875*cm 0.3175*cm 0.79375*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 4){
	make_VAR9ON_4();
}

sub make_VAR9ON_5
{
 $detector{"name"}        = "VAR9ON_5";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-3.62161*cm -2.091*cm -0.757*cm";
 $detector{"rotation"}    = "13.6816*deg -22.2778*deg -122.706*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.15875*cm 0.3175*cm 0.79375*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 5){
	make_VAR9ON_5();
}

sub make_VAR9ON_6
{
 $detector{"name"}        = "VAR9ON_6";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-3.62161*cm 2.091*cm -0.757*cm";
 $detector{"rotation"}    = "-13.6816*deg -22.2778*deg -57.2938*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.15875*cm 0.3175*cm 0.79375*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 6){
	make_VAR9ON_6();
}

sub make_VAR10_1
{
 $detector{"name"}        = "VAR10_1";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 3.90121*cm -0.410411*cm";
 $detector{"rotation"}    = "-27.12*deg 0*deg 0*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.15875*cm 0.16002*cm 1.27*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 1){
	make_VAR10_1();
}

sub make_VAR10_2
{
 $detector{"name"}        = "VAR10_2";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm -3.90121*cm -0.410411*cm";
 $detector{"rotation"}    = "27.12*deg 0*deg 0*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.15875*cm 0.16002*cm 1.27*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 2){
	make_VAR10_2();
}

sub make_VAR10_3
{
 $detector{"name"}        = "VAR10_3";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "3.37845*cm 1.9506*cm -0.410411*cm";
 $detector{"rotation"}    = "-14.3638*deg 23.2524*deg 57.0298*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.15875*cm 0.16002*cm 1.27*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 3){
	make_VAR10_3();
}

sub make_VAR10_4
{
 $detector{"name"}        = "VAR10_4";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "3.37845*cm -1.9506*cm -0.410411*cm";
 $detector{"rotation"}    = "14.3638*deg 23.2524*deg -57.0298*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.15875*cm 0.16002*cm 1.27*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 4){
	make_VAR10_4();
}

sub make_VAR10_5
{
 $detector{"name"}        = "VAR10_5";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-3.37845*cm -1.9506*cm -0.410411*cm";
 $detector{"rotation"}    = "14.3638*deg -23.2524*deg 57.0298*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.15875*cm 0.16002*cm 1.27*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 5){
	make_VAR10_5();
}

sub make_VAR10_6
{
 $detector{"name"}        = "VAR10_6";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-3.37845*cm 1.9506*cm -0.410411*cm";
 $detector{"rotation"}    = "-14.3638*deg -23.2524*deg -57.0298*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.15875*cm 0.16002*cm 1.27*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 6){
	make_VAR10_6();
}

sub make_VAR10ON_1
{
 $detector{"name"}        = "VAR10ON_1";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 5.0853*cm -2.61252*cm";
 $detector{"rotation"}    = "-25.96*deg 0*deg 0*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.15875*cm 0.16002*cm 1.27*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 1){
	make_VAR10ON_1();
}

sub make_VAR10ON_2
{
 $detector{"name"}        = "VAR10ON_2";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm -5.0853*cm -2.61252*cm";
 $detector{"rotation"}    = "25.96*deg 0*deg -180*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.15875*cm 0.16002*cm 1.27*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 2){
	make_VAR10ON_2();
}

sub make_VAR10ON_3
{
 $detector{"name"}        = "VAR10ON_3";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "4.40387*cm 2.54265*cm -2.61252*cm";
 $detector{"rotation"}    = "-13.6816*deg 22.2778*deg 57.2938*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.15875*cm 0.16002*cm 1.27*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 3){
	make_VAR10ON_3();
}

sub make_VAR10ON_4
{
 $detector{"name"}        = "VAR10ON_4";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "4.40387*cm -2.54265*cm -2.61252*cm";
 $detector{"rotation"}    = "13.6816*deg 22.2778*deg 122.706*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.15875*cm 0.16002*cm 1.27*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 4){
	make_VAR10ON_4();
}

sub make_VAR10ON_5
{
 $detector{"name"}        = "VAR10ON_5";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-4.40387*cm -2.54265*cm -2.61252*cm";
 $detector{"rotation"}    = "13.6816*deg -22.2778*deg -122.706*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.15875*cm 0.16002*cm 1.27*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 5){
	make_VAR10ON_5();
}

sub make_VAR10ON_6
{
 $detector{"name"}        = "VAR10ON_6";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-4.40387*cm 2.54265*cm -2.61252*cm";
 $detector{"rotation"}    = "-13.6816*deg -22.2778*deg -57.2938*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.15875*cm 0.16002*cm 1.27*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 6){
	make_VAR10ON_6();
}

sub make_TVR1_1
{
 $detector{"name"}        = "TVR1_1";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 4.41136*cm 2.12858*cm";
 $detector{"rotation"}    = "-10*deg 0*deg -90*deg";
 $detector{"color"}       = "00ff00";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.0635*cm 0.0635*cm 0.7493*cm";
 $detector{"material"}    = "Iron";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 1){
	make_TVR1_1();
}

sub make_TVR1_2
{
 $detector{"name"}        = "TVR1_2";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm -4.41136*cm 2.12858*cm";
 $detector{"rotation"}    = "10*deg 0*deg 90*deg";
 $detector{"color"}       = "00ff00";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.0635*cm 0.0635*cm 0.7493*cm";
 $detector{"material"}    = "Iron";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 2){
	make_TVR1_2();
}

sub make_TVR1_3
{
 $detector{"name"}        = "TVR1_3";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "3.82023*cm 2.20568*cm 2.12858*cm";
 $detector{"rotation"}    = "-5.03837*deg 8.64917*deg -30.3813*deg";
 $detector{"color"}       = "00ff00";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.0635*cm 0.0635*cm 0.7493*cm";
 $detector{"material"}    = "Iron";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 3){
	make_TVR1_3();
}

sub make_TVR1_4
{
 $detector{"name"}        = "TVR1_4";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "3.82023*cm -2.20568*cm 2.12858*cm";
 $detector{"rotation"}    = "5.03837*deg 8.64917*deg 30.3813*deg";
 $detector{"color"}       = "00ff00";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.0635*cm 0.0635*cm 0.7493*cm";
 $detector{"material"}    = "Iron";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 4){
	make_TVR1_4();
}

sub make_TVR1_5
{
 $detector{"name"}        = "TVR1_5";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-3.82023*cm -2.20568*cm 2.12858*cm";
 $detector{"rotation"}    = "5.03837*deg -8.64917*deg 149.619*deg";
 $detector{"color"}       = "00ff00";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.0635*cm 0.0635*cm 0.7493*cm";
 $detector{"material"}    = "Iron";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 5){
	make_TVR1_5();
}

sub make_TVR1_6
{
 $detector{"name"}        = "TVR1_6";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-3.82023*cm 2.20568*cm 2.12858*cm";
 $detector{"rotation"}    = "-5.03837*deg -8.64917*deg -149.619*deg";
 $detector{"color"}       = "00ff00";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.0635*cm 0.0635*cm 0.7493*cm";
 $detector{"material"}    = "Iron";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 6){
	make_TVR1_6();
}

sub make_TVR1ON_1
{
 $detector{"name"}        = "TVR1ON_1";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 3.73048*cm 1.31721*cm";
 $detector{"rotation"}    = "-90*deg 0*deg -90*deg";
 $detector{"color"}       = "00ff00";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.0635*cm 0.0635*cm 0.7493*cm";
 $detector{"material"}    = "Iron";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 1){
	make_TVR1ON_1();
}

sub make_TVR1ON_2
{
 $detector{"name"}        = "TVR1ON_2";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm -3.73048*cm 1.31721*cm";
 $detector{"rotation"}    = "90*deg 0*deg 90*deg";
 $detector{"color"}       = "00ff00";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.0635*cm 0.0635*cm 0.7493*cm";
 $detector{"material"}    = "Iron";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 2){
	make_TVR1ON_2();
}

sub make_TVR1ON_3
{
 $detector{"name"}        = "TVR1ON_3";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "3.2306*cm 1.86524*cm 1.31721*cm";
 $detector{"rotation"}    = "-90*deg 60*deg -90*deg";
 $detector{"color"}       = "00ff00";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.0635*cm 0.0635*cm 0.7493*cm";
 $detector{"material"}    = "Iron";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 3){
	make_TVR1ON_3();
}

sub make_TVR1ON_4
{
 $detector{"name"}        = "TVR1ON_4";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "3.2306*cm -1.86524*cm 1.31721*cm";
 $detector{"rotation"}    = "90*deg 60*deg 90*deg";
 $detector{"color"}       = "00ff00";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.0635*cm 0.0635*cm 0.7493*cm";
 $detector{"material"}    = "Iron";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 4){
	make_TVR1ON_4();
}

sub make_TVR1ON_5
{
 $detector{"name"}        = "TVR1ON_5";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-3.2306*cm -1.86524*cm 1.31721*cm";
 $detector{"rotation"}    = "90*deg -60*deg 90*deg";
 $detector{"color"}       = "00ff00";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.0635*cm 0.0635*cm 0.7493*cm";
 $detector{"material"}    = "Iron";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 5){
	make_TVR1ON_5();
}

sub make_TVR1ON_6
{
 $detector{"name"}        = "TVR1ON_6";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-3.2306*cm 1.86524*cm 1.31721*cm";
 $detector{"rotation"}    = "-90*deg -60*deg -90*deg";
 $detector{"color"}       = "00ff00";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.0635*cm 0.0635*cm 0.7493*cm";
 $detector{"material"}    = "Iron";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 6){
	make_TVR1ON_6();
}

sub make_TVR2_1
{
 $detector{"name"}        = "TVR2_1";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 4.23718*cm 3.11663*cm";
 $detector{"rotation"}    = "-10*deg 0*deg -90*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.13068*cm 0.254*cm 0*deg 360*deg";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 1){
	make_TVR2_1();
}

sub make_TVR2_2
{
 $detector{"name"}        = "TVR2_2";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm -4.23718*cm 3.11663*cm";
 $detector{"rotation"}    = "10*deg 0*deg 90*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.13068*cm 0.254*cm 0*deg 360*deg";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 2){
	make_TVR2_2();
}

sub make_TVR2_3
{
 $detector{"name"}        = "TVR2_3";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "3.6694*cm 2.11859*cm 3.11663*cm";
 $detector{"rotation"}    = "-5.03837*deg 8.64917*deg -30.3813*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.13068*cm 0.254*cm 0*deg 360*deg";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 3){
	make_TVR2_3();
}

sub make_TVR2_4
{
 $detector{"name"}        = "TVR2_4";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "3.6694*cm -2.11859*cm 3.11663*cm";
 $detector{"rotation"}    = "5.03837*deg 8.64917*deg 30.3813*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.13068*cm 0.254*cm 0*deg 360*deg";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 4){
	make_TVR2_4();
}

sub make_TVR2_5
{
 $detector{"name"}        = "TVR2_5";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-3.6694*cm -2.11859*cm 3.11663*cm";
 $detector{"rotation"}    = "5.03837*deg -8.64917*deg 149.619*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.13068*cm 0.254*cm 0*deg 360*deg";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 5){
	make_TVR2_5();
}


sub make_TVR2_6
{
 $detector{"name"}        = "TVR2_6";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-3.6694*cm 2.11859*cm 3.11663*cm";
 $detector{"rotation"}    = "-5.03837*deg -8.64917*deg -149.619*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.13068*cm 0.254*cm 0*deg 360*deg";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 6){
	make_TVR2_6();
}

sub make_TVR2ON_1
{
 $detector{"name"}        = "TVR2ON_1";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 2.72718*cm 1.31721*cm";
 $detector{"rotation"}    = "-90*deg 0*deg -90*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.13068*cm 0.254*cm 0*deg 360*deg";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 1){
	make_TVR2ON_1();
}

sub make_TVR2ON_2
{
 $detector{"name"}        = "TVR2ON_2";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm -2.72718*cm 1.31721*cm";
 $detector{"rotation"}    = "90*deg 0*deg 90*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.13068*cm 0.254*cm 0*deg 360*deg";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 2){
	make_TVR2ON_2();
}

sub make_TVR2ON_3
{
 $detector{"name"}        = "TVR2ON_3";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "2.36174*cm 1.36359*cm 1.31721*cm";
 $detector{"rotation"}    = "-90*deg 60*deg -90*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.13068*cm 0.254*cm 0*deg 360*deg";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 3){
	make_TVR2ON_3();
}

sub make_TVR2ON_4
{
 $detector{"name"}        = "TVR2ON_4";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "2.36174*cm -1.36359*cm 1.31721*cm";
 $detector{"rotation"}    = "90*deg 60*deg 90*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.13068*cm 0.254*cm 0*deg 360*deg";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 4){
	make_TVR2ON_4();
}

sub make_TVR2ON_5
{
 $detector{"name"}        = "TVR2ON_5";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-2.36174*cm -1.36359*cm 1.31721*cm";
 $detector{"rotation"}    = "90*deg -60*deg 90*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.13068*cm 0.254*cm 0*deg 360*deg";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 5){
	make_TVR2ON_5();
}

sub make_TVR2ON_6
{
 $detector{"name"}        = "TVR2ON_6";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-2.36174*cm 1.36359*cm 1.31721*cm";
 $detector{"rotation"}    = "-90*deg -60*deg -90*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.13068*cm 0.254*cm 0*deg 360*deg";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 6){
	make_TVR2ON_6();
}

sub make_TVR3_1
{
 $detector{"name"}        = "TVR3_1";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 4.16002*cm 3.55438*cm";
 $detector{"rotation"}    = "-10*deg 0*deg -90*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Cons";

 $detector{"dimensions"}  = "0*cm 0.13068*cm 0*cm 0.0635*cm 0.1905*cm 0*deg 360*deg";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 1){
	make_TVR3_1();
}

sub make_TVR3_2
{
 $detector{"name"}        = "TVR3_2";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm -4.16002*cm 3.55438*cm";
 $detector{"rotation"}    = "10*deg 0*deg 90*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Cons";

 $detector{"dimensions"}  = "0*cm 0.13068*cm 0*cm 0.0635*cm 0.1905*cm 0*deg 360*deg";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 2){
	make_TVR3_2();
}

sub make_TVR3_3
{
 $detector{"name"}        = "TVR3_3";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "3.60258*cm 2.08001*cm 3.55438*cm";
 $detector{"rotation"}    = "-5.03837*deg 8.64917*deg -30.3813*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Cons";

 $detector{"dimensions"}  = "0*cm 0.13068*cm 0*cm 0.0635*cm 0.1905*cm 0*deg 360*deg";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 3){
	make_TVR3_3();
}

sub make_TVR3_4
{
 $detector{"name"}        = "TVR3_4";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "3.60258*cm -2.08001*cm 3.55438*cm";
 $detector{"rotation"}    = "5.03837*deg 8.64917*deg 30.3813*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Cons";

 $detector{"dimensions"}  = "0*cm 0.13068*cm 0*cm 0.0635*cm 0.1905*cm 0*deg 360*deg";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 4){
	make_TVR3_4();
}

sub make_TVR3_5
{
 $detector{"name"}        = "TVR3_5";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-3.60258*cm -2.08001*cm 3.55438*cm";
 $detector{"rotation"}    = "5.03837*deg -8.64917*deg 149.619*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Cons";

 $detector{"dimensions"}  = "0*cm 0.13068*cm 0*cm 0.0635*cm 0.1905*cm 0*deg 360*deg";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 5){
	make_TVR3_5();
}

sub make_TVR3_6
{
 $detector{"name"}        = "TVR3_6";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-3.60258*cm 2.08001*cm 3.55438*cm";
 $detector{"rotation"}    = "-5.03837*deg -8.64917*deg -149.619*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Cons";

 $detector{"dimensions"}  = "0*cm 0.13068*cm 0*cm 0.0635*cm 0.1905*cm 0*deg 360*deg";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 6){
	make_TVR3_6();
}

sub make_TVR3ON_1
{
 $detector{"name"}        = "TVR3ON_1";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 2.28268*cm 1.31721*cm";
 $detector{"rotation"}    = "-90*deg 0*deg -90*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Cons";

 $detector{"dimensions"}  = "0*cm 0.13068*cm 0*cm 0.0635*cm 0.1905*cm 0*deg 360*deg";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 1){
	make_TVR3ON_1();
}

sub make_TVR3ON_2
{
 $detector{"name"}        = "TVR3ON_2";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm -2.28268*cm 1.31721*cm";
 $detector{"rotation"}    = "90*deg 0*deg 90*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Cons";

 $detector{"dimensions"}  = "0*cm 0.13068*cm 0*cm 0.0635*cm 0.1905*cm 0*deg 360*deg";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 2){
	make_TVR3ON_2();
}

sub make_TVR3ON_3
{
 $detector{"name"}        = "TVR3ON_3";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "1.9768*cm 1.14134*cm 1.31721*cm";
 $detector{"rotation"}    = "-90*deg 60*deg -90*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Cons";

 $detector{"dimensions"}  = "0*cm 0.13068*cm 0*cm 0.0635*cm 0.1905*cm 0*deg 360*deg";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 3){
	make_TVR3ON_3();
}

sub make_TVR3ON_4
{
 $detector{"name"}        = "TVR3ON_4";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "1.9768*cm -1.14134*cm 1.31721*cm";
 $detector{"rotation"}    = "90*deg 60*deg 90*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Cons";

 $detector{"dimensions"}  = "0*cm 0.13068*cm 0*cm 0.0635*cm 0.1905*cm 0*deg 360*deg";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 4){
	make_TVR3ON_4();
}


sub make_TVR3ON_5
{
 $detector{"name"}        = "TVR3ON_5";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-1.9768*cm -1.14134*cm 1.31721*cm";
 $detector{"rotation"}    = "90*deg -60*deg 90*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Cons";

 $detector{"dimensions"}  = "0*cm 0.13068*cm 0*cm 0.0635*cm 0.1905*cm 0*deg 360*deg";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 5){
	make_TVR3ON_5();
}

sub make_TVR3ON_6
{
 $detector{"name"}        = "TVR3ON_6";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-1.9768*cm 1.14134*cm 1.31721*cm";
 $detector{"rotation"}    = "-90*deg -60*deg -90*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Cons";

 $detector{"dimensions"}  = "0*cm 0.13068*cm 0*cm 0.0635*cm 0.1905*cm 0*deg 360*deg";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 6){
	make_TVR3ON_6();
}

sub make_TVR4_1
{
 $detector{"name"}        = "TVR4_1";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 3.97041*cm 4.62998*cm";
 $detector{"rotation"}    = "-10*deg 0*deg -90*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.0635*cm 0.9017*cm 0*deg 360*deg";
 $detector{"material"}    = "Carbon";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 1){
	make_TVR4_1();
}

sub make_TVR4_2
{
 $detector{"name"}        = "TVR4_2";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm -3.97041*cm 4.62998*cm";
 $detector{"rotation"}    = "10*deg 0*deg 90*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.0635*cm 0.9017*cm 0*deg 360*deg";
 $detector{"material"}    = "Carbon";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 2){
	make_TVR4_2();
}

sub make_TVR4_3
{
 $detector{"name"}        = "TVR4_3";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "3.43838*cm 1.98521*cm 4.62998*cm";
 $detector{"rotation"}    = "-5.03837*deg 8.64917*deg -30.3813*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.0635*cm 0.9017*cm 0*deg 360*deg";
 $detector{"material"}    = "Carbon";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 3){
	make_TVR4_3();
}

sub make_TVR4_4
{
 $detector{"name"}        = "TVR4_4";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "3.43838*cm -1.98521*cm 4.62998*cm";
 $detector{"rotation"}    = "5.03837*deg 8.64917*deg 30.3813*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.0635*cm 0.9017*cm 0*deg 360*deg";
 $detector{"material"}    = "Carbon";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 4){
	make_TVR4_4();
}

sub make_TVR4_5
{
 $detector{"name"}        = "TVR4_5";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-3.43838*cm -1.98521*cm 4.62998*cm";
 $detector{"rotation"}    = "5.03837*deg -8.64917*deg 149.619*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.0635*cm 0.9017*cm 0*deg 360*deg";
 $detector{"material"}    = "Carbon";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 5){
	make_TVR4_5();
}

sub make_TVR4_6
{
 $detector{"name"}        = "TVR4_6";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-3.43838*cm 1.98521*cm 4.62998*cm";
 $detector{"rotation"}    = "-5.03837*deg -8.64917*deg -149.619*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.0635*cm 0.9017*cm 0*deg 360*deg";
 $detector{"material"}    = "Carbon";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 6){
	make_TVR4_6();
}

sub make_TVR4ON_1
{
 $detector{"name"}        = "TVR4ON_1";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 1.19048*cm 1.31721*cm";
 $detector{"rotation"}    = "-90*deg 0*deg -90*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.0635*cm 0.9017*cm 0*deg 360*deg";
 $detector{"material"}    = "Carbon";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 1){
	make_TVR4ON_1();
}

sub make_TVR4ON_2
{
 $detector{"name"}        = "TVR4ON_2";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm -1.19048*cm 1.31721*cm";
 $detector{"rotation"}    = "90*deg 0*deg 90*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.0635*cm 0.9017*cm 0*deg 360*deg";
 $detector{"material"}    = "Carbon";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 2){
	make_TVR4ON_2();
}

sub make_TVR4ON_3
{
 $detector{"name"}        = "TVR4ON_3";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "1.03096*cm 0.595242*cm 1.31721*cm";
 $detector{"rotation"}    = "-90*deg 60*deg -90*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.0635*cm 0.9017*cm 0*deg 360*deg";
 $detector{"material"}    = "Carbon";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 3){
	make_TVR4ON_3();
}

sub make_TVR4ON_4
{
 $detector{"name"}        = "TVR4ON_4";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "1.03096*cm -0.595242*cm 1.31721*cm";
 $detector{"rotation"}    = "90*deg 60*deg 90*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.0635*cm 0.9017*cm 0*deg 360*deg";
 $detector{"material"}    = "Carbon";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 4){
	make_TVR4ON_4();
}

sub make_TVR4ON_5
{
 $detector{"name"}        = "TVR4ON_5";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-1.03096*cm -0.595242*cm 1.31721*cm";
 $detector{"rotation"}    = "90*deg -60*deg 90*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.0635*cm 0.9017*cm 0*deg 360*deg";
 $detector{"material"}    = "Carbon";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 5){
	make_TVR4ON_5();
}

sub make_TVR4ON_6
{
 $detector{"name"}        = "TVR4ON_6";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-1.03096*cm 0.595242*cm 1.31721*cm";
 $detector{"rotation"}    = "-90*deg -60*deg -90*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.0635*cm 0.9017*cm 0*deg 360*deg";
 $detector{"material"}    = "Carbon";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 6){
	make_TVR4ON_6();
}

sub make_TALAOFF
{
 $detector{"name"}        = "TALA";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 3.76374*cm 5.80116*cm";
 $detector{"rotation"}    = "-100*deg 0*deg 0*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.185*cm 0.2377*cm 0.08615*cm";
 $detector{"material"}    = "Vacuum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 1){
	make_TALAOFF();
}

sub make_TALAON
{
 $detector{"name"}        = "TALA";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 0.0623*cm 1.316*cm";
 $detector{"rotation"}    = "0*deg 0*deg 180*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.185*cm 0.2377*cm 0.08615*cm";
 $detector{"material"}    = "Vacuum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 1){
	make_TALAON();
}

sub make_VALA
{
 $detector{"name"}        = "VALA";
 $detector{"mother"}      = "TALA";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 0.0623*cm 0*cm";
 $detector{"rotation"}    = "0*deg 0*deg 0*deg";
 $detector{"color"}       = "00ffff";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.15*cm 0.00075*cm 0*deg 360*deg";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VALA();

sub make_TVR5_TALA
{
 $detector{"name"}        = "TVR5_TALA";
 $detector{"mother"}      = "TALA";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 0.0623*cm 0*cm";
 $detector{"rotation"}    = "0*deg 0*deg 0*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0.15*cm 0.1754*cm 0.08615*cm -30*deg 210*deg";
 $detector{"material"}    = "Carbon";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_TVR5_TALA();

sub make_TVR61_TALA
{
 $detector{"name"}        = "TVR61_TALA";
 $detector{"mother"}      = "TALA";
 $detector{"description"} = "";
 $detector{"pos"}         = "-0.091*cm -0.130836*cm 0*cm";
 $detector{"rotation"}    = "90*deg -60*deg 0*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Trd";

 $detector{"dimensions"}  = "0.1087*cm 0.1381*cm 0.08615*cm 0.08615*cm 0.0254*cm";
 $detector{"material"}    = "Carbon";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_TVR61_TALA();

sub make_TVR62_TALA
{
 $detector{"name"}        = "TVR62_TALA";
 $detector{"mother"}      = "TALA";
 $detector{"description"} = "";
 $detector{"pos"}         = "0.091*cm -0.130836*cm 0*cm";
 $detector{"rotation"}    = "90*deg 60*deg 180*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Trd";

 $detector{"dimensions"}  = "0.1087*cm 0.1381*cm 0.08615*cm 0.08615*cm 0.0254*cm";
 $detector{"material"}    = "Carbon";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_TVR62_TALA();

sub make_TF56OFF
{
 $detector{"name"}        = "TF56";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm -3.76374*cm 5.80116*cm";
 $detector{"rotation"}    = "100*deg 0*deg 180*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.185*cm 0.2377*cm 0.08615*cm";
 $detector{"material"}    = "Vacuum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 2){
	make_TF56OFF();
}

sub make_TF56ON
{
 $detector{"name"}        = "TF56";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm -0.0623*cm 1.316*cm";
 $detector{"rotation"}    = "0*deg 0*deg 0*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.185*cm 0.2377*cm 0.08615*cm";
 $detector{"material"}    = "Vacuum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 2){
	make_TF56ON();
}

sub make_VF56
{
 $detector{"name"}        = "VF56";
 $detector{"mother"}      = "TF56";
 $detector{"description"}	 = "";
 $detector{"pos"}         = "0*cm 0.0623*cm 0*cm";
 $detector{"rotation"}    = "0*deg 0*deg 0*deg";
 $detector{"color"}       = "00ff00";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.15*cm 0.02*cm 0*deg 360*deg";
 $detector{"material"}    = "Iron";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VF56();

sub make_TVR5_TF56
{
 $detector{"name"}        = "TVR5_TF56";
 $detector{"mother"}      = "TF56";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 0.0623*cm 0*cm";
 $detector{"rotation"}    = "0*deg 0*deg 0*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0.15*cm 0.1754*cm 0.08615*cm -30*deg 210*deg";
 $detector{"material"}    = "Carbon";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_TVR5_TF56();

sub make_TVR61_TF56
{
 $detector{"name"}        = "TVR61_TF56";
 $detector{"mother"}      = "TF56";
 $detector{"description"} = "";
 $detector{"pos"}         = "-0.091*cm -0.130836*cm 0*cm";
 $detector{"rotation"}    = "90*deg -60*deg 0*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Trd";

 $detector{"dimensions"}  = "0.1087*cm 0.1381*cm 0.08615*cm 0.08615*cm 0.0254*cm";
 $detector{"material"}    = "Carbon";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_TVR61_TF56();

sub make_TVR62_TF56
{
 $detector{"name"}        = "TVR62_TF56";
 $detector{"mother"}      = "TF56";
 $detector{"description"} = "";
 $detector{"pos"}         = "0.091*cm -0.130836*cm 0*cm";
 $detector{"rotation"}    = "90*deg 60*deg 180*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Trd";

 $detector{"dimensions"}  = "0.1087*cm 0.1381*cm 0.08615*cm 0.08615*cm 0.0254*cm";
 $detector{"material"}    = "Carbon";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_TVR62_TF56();

sub make_TCAROFF
{
 $detector{"name"}        = "TCAR";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "3.2594*cm 1.88187*cm 5.80116*cm";
 $detector{"rotation"}    = "-109.425*deg 58.5251*deg -15.7396*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.185*cm 0.2377*cm 0.08615*cm";
 $detector{"material"}    = "Vacuum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 3){
	make_TCAROFF();
}

sub make_TCARON
{
 $detector{"name"}        = "TCAR";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0.05395*cm 0.03115*cm 1.316*cm";
 $detector{"rotation"}    = "0*deg 0*deg -120*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.185*cm 0.2377*cm 0.08615*cm";
 $detector{"material"}    = "Vacuum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 3){
	make_TCARON();
}

sub make_VCAR
{
 $detector{"name"}        = "VCAR";
 $detector{"mother"}      = "TCAR";
 $detector{"description"}	 = "";
 $detector{"pos"}         = "0*cm 0.0623*cm 0*cm";
 $detector{"rotation"}    = "0*deg 0*deg 0*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.15*cm 0.08615*cm 0*deg 360*deg";
 $detector{"material"}    = "Carbon";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VCAR();

sub make_TVR5_TCAR
{
 $detector{"name"}        = "TVR5_TCAR";
 $detector{"mother"}      = "TCAR";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 0.0623*cm 0*cm";
 $detector{"rotation"}    = "0*deg 0*deg 0*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0.15*cm 0.1754*cm 0.08615*cm -30*deg 210*deg";
 $detector{"material"}    = "Carbon";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_TVR5_TCAR();

sub make_TVR61_TCAR
{
 $detector{"name"}        = "TVR61_TCAR";
 $detector{"mother"}      = "TCAR";
 $detector{"description"} = "";
 $detector{"pos"}         = "-0.091*cm -0.130836*cm 0*cm";
 $detector{"rotation"}    = "90*deg -60*deg 0*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Trd";

 $detector{"dimensions"}  = "0.1087*cm 0.1381*cm 0.08615*cm 0.08615*cm 0.0254*cm";
 $detector{"material"}    = "Vacuum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_TVR61_TCAR();

sub make_TVR62_TCAR
{
 $detector{"name"}        = "TVR62_TCAR";
 $detector{"mother"}      = "TCAR";
 $detector{"description"} = "";
 $detector{"pos"}         = "0.091*cm -0.130836*cm 0*cm";
 $detector{"rotation"}    = "90*deg 60*deg 180*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Trd";

 $detector{"dimensions"}  = "0.1087*cm 0.1381*cm 0.08615*cm 0.08615*cm 0.0254*cm";
 $detector{"material"}    = "Vacuum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_TVR62_TCAR();

sub make_TLEDOFF
{
 $detector{"name"}        = "TLED";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "3.2594*cm -1.88187*cm 5.80116*cm";
 $detector{"rotation"}    = "109.425*deg 58.5251*deg -163.26*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.185*cm 0.2377*cm 0.08615*cm";
 $detector{"material"}    = "Vacuum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 4){
	make_TLEDOFF();
}

sub make_TLEDON
{
 $detector{"name"}        = "TLED";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0.05395*cm -0.03115*cm 1.316*cm";
 $detector{"rotation"}    = "0*deg 0*deg -60*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.185*cm 0.2377*cm 0.08615*cm";
 $detector{"material"}    = "Vacuum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 4){
	make_TLEDON();
}

sub make_VLED
{
 $detector{"name"}        = "VLED";
 $detector{"mother"}      = "TLED";
 $detector{"description"}	 = "";
 $detector{"pos"}         = "0*cm 0.0623*cm 0*cm";
 $detector{"rotation"}    = "0*deg 0*deg 0*deg";
 $detector{"color"}       = "ff00ff";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.15*cm 0.007*cm 0*deg 360*deg";
 $detector{"material"}    = "Lead";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VLED();

sub make_TVR5_TLED
{
 $detector{"name"}        = "TVR5_TLED";
 $detector{"mother"}      = "TLED";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 0.0623*cm 0*cm";
 $detector{"rotation"}    = "0*deg 0*deg 0*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0.15*cm 0.1754*cm 0.08615*cm -30*deg 210*deg";
 $detector{"material"}    = "Carbon";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_TVR5_TLED();

sub make_TVR61_TLED
{
 $detector{"name"}        = "TVR61_TLED";
 $detector{"mother"}      = "TLED";
 $detector{"description"} = "";
 $detector{"pos"}         = "-0.091*cm -0.130836*cm 0*cm";
 $detector{"rotation"}    = "90*deg -60*deg 0*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Trd";

 $detector{"dimensions"}  = "0.1087*cm 0.1381*cm 0.08615*cm 0.08615*cm 0.0254*cm";
 $detector{"material"}    = "Carbon";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_TVR61_TLED();

sub make_TVR62_TLED
{
 $detector{"name"}        = "TVR62_TLED";
 $detector{"mother"}      = "TLED";
 $detector{"description"} = "";
 $detector{"pos"}         = "0.091*cm -0.130836*cm 0*cm";
 $detector{"rotation"}    = "90*deg 60*deg 180*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Trd";

 $detector{"dimensions"}  = "0.1087*cm 0.1381*cm 0.08615*cm 0.08615*cm 0.0254*cm";
 $detector{"material"}    = "Carbon";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_TVR62_TLED();

sub make_TTINOFF
{
 $detector{"name"}        = "TTIN";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-3.2594*cm -1.88187*cm 5.80116*cm";
 $detector{"rotation"}    = "109.425*deg -58.5251*deg 163.26*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.185*cm 0.2377*cm 0.08615*cm";
 $detector{"material"}    = "Vacuum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 5){
	make_TTINOFF();
}

sub make_TTINON
{
 $detector{"name"}        = "TTIN";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-0.05395*cm -0.03115*cm 1.316*cm";
 $detector{"rotation"}    = "0*deg 0*deg 60*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.185*cm 0.2377*cm 0.08615*cm";
 $detector{"material"}    = "Vacuum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 5){
	make_TTINON();
}

sub make_VTIN
{
 $detector{"name"}        = "VTIN";
 $detector{"mother"}      = "TTIN";
 $detector{"description"}	 = "";
 $detector{"pos"}         = "0*cm 0.0623*cm 0*cm";
 $detector{"rotation"}    = "0*deg 0*deg 0*deg";
 $detector{"color"}       = "ff0000";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.15*cm 0.0156*cm 0*deg 360*deg";
 $detector{"material"}    = "Lead";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VTIN();

sub make_TVR5_TTIN
{
 $detector{"name"}        = "TVR5_TTIN";
 $detector{"mother"}      = "TTIN";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 0.0623*cm 0*cm";
 $detector{"rotation"}    = "0*deg 0*deg 0*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0.15*cm 0.1754*cm 0.08615*cm -30*deg 210*deg";
 $detector{"material"}    = "Carbon";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_TVR5_TTIN();

sub make_TVR61_TTIN
{
 $detector{"name"}        = "TVR61_TTIN";
 $detector{"mother"}      = "TTIN";
 $detector{"description"} = "";
 $detector{"pos"}         = "-0.091*cm -0.130836*cm 0*cm";
 $detector{"rotation"}    = "90*deg -60*deg 0*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Trd";

 $detector{"dimensions"}  = "0.1087*cm 0.1381*cm 0.08615*cm 0.08615*cm 0.0254*cm";
 $detector{"material"}    = "Carbon";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_TVR61_TTIN();

sub make_TVR62_TTIN
{
 $detector{"name"}        = "TVR62_TTIN";
 $detector{"mother"}      = "TTIN";
 $detector{"description"} = "";
 $detector{"pos"}         = "0.091*cm -0.130836*cm 0*cm";
 $detector{"rotation"}    = "90*deg 60*deg 180*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Trd";

 $detector{"dimensions"}  = "0.1087*cm 0.1381*cm 0.08615*cm 0.08615*cm 0.0254*cm";
 $detector{"material"}    = "Carbon";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_TVR62_TTIN();

sub make_TALBOFF
{
 $detector{"name"}        = "TALB";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-3.2594*cm 1.88187*cm 5.80116*cm";
 $detector{"rotation"}    = "-109.425*deg -58.5251*deg 16.7396*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.185*cm 0.2377*cm 0.08615*cm";
 $detector{"material"}    = "Vacuum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon != 6){
	make_TALBOFF();
}

sub make_TALBON
{
 $detector{"name"}        = "TALB";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "-0.05395*cm 0.03115*cm 1.316*cm";
 $detector{"rotation"}    = "0*deg 0*deg 120*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Box";

 $detector{"dimensions"}  = "0.185*cm 0.2377*cm 0.08615*cm";
 $detector{"material"}    = "Vacuum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

if($wireon == 6){
	make_TALBON();
}

sub make_VALB
{
 $detector{"name"}        = "VALB";
 $detector{"mother"}      = "TALB";
 $detector{"description"}	 = "";
 $detector{"pos"}         = "0*cm 0.0623*cm 0*cm";
 $detector{"rotation"}    = "0*deg 0*deg 0*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.15*cm 0.029*cm 0*deg 360*deg";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_VALB();

sub make_TVR5_TALB
{
 $detector{"name"}        = "TVR5_TALB";
 $detector{"mother"}      = "TALB";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 0.0623*cm 0*cm";
 $detector{"rotation"}    = "0*deg 0*deg 0*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0.15*cm 0.1754*cm 0.08615*cm -30*deg 210*deg";
 $detector{"material"}    = "Carbon";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_TVR5_TALB();

sub make_TVR61_TALB
{
 $detector{"name"}        = "TVR61_TALB";
 $detector{"mother"}      = "TALB";
 $detector{"description"} = "";
 $detector{"pos"}         = "-0.091*cm -0.130836*cm 0*cm";
 $detector{"rotation"}    = "90*deg -60*deg 0*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Trd";

 $detector{"dimensions"}  = "0.1087*cm 0.1381*cm 0.08615*cm 0.08615*cm 0.0254*cm";
 $detector{"material"}    = "Carbon";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_TVR61_TALB();

sub make_TVR62_TALB
{
 $detector{"name"}        = "TVR62_TALB";
 $detector{"mother"}      = "TALB";
 $detector{"description"} = "";
 $detector{"pos"}         = "0.091*cm -0.130836*cm 0*cm";
 $detector{"rotation"}    = "90*deg 60*deg 180*deg";
 $detector{"color"}       = "000000";
 $detector{"type"}        = "Trd";

 $detector{"dimensions"}  = "0.1087*cm 0.1381*cm 0.08615*cm 0.08615*cm 0.0254*cm";
 $detector{"material"}    = "Carbon";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_TVR62_TALB();

sub make_TARG
{
 $detector{"name"}        = "TARG";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 0*cm -6.196*cm";
 $detector{"rotation"}    = "0*deg 0*deg 0*deg";
 $detector{"color"}       = "0000ff";
 $detector{"type"}        = "Polycone";

 $detector{"dimensions"}  = "0*deg 360*deg 10 0.445*cm 0.445*cm 0.35*cm 0.35*cm 0.35*cm 0.35*cm 0.325*cm 0.325*cm 0*cm 0*cm 1.4395*cm 1.4395*cm 1.4395*cm 1.4395*cm 0.8175*cm 0.8175*cm 0.8175*cm 0.595*cm 0.595*cm 0.348*cm -3.53*cm -2.24*cm -2.24*cm -1.23*cm -0.33*cm -0.19*cm -0.19*cm 1.48*cm 1.48*cm 3.48*cm ";
 $detector{"material"}    = "LD2";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 1;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_TARG();

sub make_TGCL
{
 $detector{"name"}        = "TGCL";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 0*cm -6.196*cm";
 $detector{"rotation"}    = "0*deg 0*deg 0*deg";
 $detector{"color"}       = "ffff00";
 $detector{"type"}        = "Polycone";

 $detector{"dimensions"}  = "0*deg 360*deg 4 0.8175*cm 0.595*cm 0.595*cm 0.348*cm 0.822641*cm 0.600141*cm 0.600141*cm 0.353141*cm -0.19*cm 1.48*cm 1.48*cm 3.48*cm";
 $detector{"material"}    = "Kapton";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_TGCL();

sub make_TGEP
{
 $detector{"name"}        = "TGEP";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 0*cm -6.196*cm";
 $detector{"rotation"}    = "0*deg 0*deg 0*deg";
 $detector{"color"}       = "ffff00";
 $detector{"type"}        = "Polycone";

 $detector{"dimensions"}  = "0*deg 360*deg 5 0.376829*cm 0.373175*cm 0.353141*cm 0.348*cm 0.348*cm 0.376829*cm 0.417175*cm 0.358141*cm 0.358141*cm 0.353141*cm 3.292*cm 3.321*cm 3.48*cm 3.48*cm 3.49*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_TGEP();

sub make_TGKP
{
 $detector{"name"}        = "TGKP";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 0*cm -6.196*cm";
 $detector{"rotation"}    = "0*deg 0*deg 0*deg";
 $detector{"color"}       = "ffff00";
 $detector{"type"}        = "Polycone";

 $detector{"dimensions"}  = "0*deg 360*deg 2 0.417175*cm 0.353141*cm 0.423375*cm 0.359341*cm 3.321*cm 3.49*cm";
 $detector{"material"}    = "Kapton";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_TGKP();

sub make_TGEC
{
 $detector{"name"}        = "TGEC";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 0*cm -2.7035*cm";
 $detector{"rotation"}    = "0*deg 0*deg 0*deg";
 $detector{"color"}       = "ffff00";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0.2*cm 0.359341*cm 0.0025*cm 0*deg 360*deg";
 $detector{"material"}    = "Kapton";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_TGEC();

sub make_TGW1
{
 $detector{"name"}        = "TGW1";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 0*cm -2.70675*cm";
 $detector{"rotation"}    = "0*deg 0*deg 0*deg";
 $detector{"color"}       = "ffff00";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.28*cm 0.00075*cm 0*deg 360*deg";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_TGW1();

sub make_TGSI
{
 $detector{"name"}        = "TGSI";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 0*cm -6.196*cm";
 $detector{"rotation"}    = "0*deg 0*deg 0*deg";
 $detector{"color"}       = "ffff00";
 $detector{"type"}        = "Polycone";

 $detector{"dimensions"}  = "0*deg 360*deg 8 0.922641*cm 0.700141*cm 0.700141*cm 0.453141*cm 0*cm 0*cm 0.453141*cm 0.453141*cm 0.929791*cm 0.707291*cm 0.707291*cm 0.460291*cm 0.460291*cm 0.460291*cm 0.460291*cm 0.460291*cm -0.19*cm 1.48*cm 1.48*cm 3.58*cm 3.58*cm 3.58715*cm 3.58715*cm 5.58715*cm";
 $detector{"material"}    = "Epoxy";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_TGSI();

sub make_TGSA
{
 $detector{"name"}        = "TGSA";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 0*cm -6.196*cm";
 $detector{"rotation"}    = "0*deg 0*deg 0*deg";
 $detector{"color"}       = "ffff00";
 $detector{"type"}        = "Polycone";

 $detector{"dimensions"}  = "0*deg 360*deg 2 0*cm 0*cm 0.460291*cm 0.460291*cm 5.58715*cm 5.58865*cm";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_TGSA();

sub make_TGW2
{
 $detector{"name"}        = "TGW2";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 0*cm -4.71675*cm";
 $detector{"rotation"}    = "0*deg 0*deg 0*deg";
 $detector{"color"}       = "ffff00";
 $detector{"type"}        = "Tube";

 $detector{"dimensions"}  = "0*cm 0.2*cm 0.00075*cm 0*deg 360*deg";
 $detector{"material"}    = "Aluminum";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_TGW2();

sub make_TGFL
{
 $detector{"name"}        = "TGFL";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 0*cm -6.196*cm";
 $detector{"rotation"}    = "0*deg 0*deg 0*deg";
 $detector{"color"}       = "ffff00";
 $detector{"type"}        = "Polycone";

 $detector{"dimensions"}  = "0*deg 360*deg 10 0.3495*cm 0.3495*cm 0.3495*cm 1.4395*cm 1.4395*cm 1.4395*cm 1.4395*cm 1.4395*cm 0.8175*cm 0.8175*cm 0.6795*cm 2.0995*cm 2.0995*cm 1.6995*cm 1.6995*cm 1.8495*cm 1.8495*cm 1.6835*cm 1.0615*cm 0.8175*cm -4.78*cm -4.15*cm -3.53*cm -3.53*cm -2.84*cm -2.84*cm -1.47*cm -1.23*cm -0.33*cm 0*cm";
 $detector{"material"}    = "Kapton";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_TGFL();

sub make_TGTU
{
 $detector{"name"}        = "TGTU";
 $detector{"mother"}      = "VOLM";
 $detector{"description"} = "";
 $detector{"pos"}         = "0*cm 0*cm -6.196*cm";
 $detector{"rotation"}    = "0*deg 0*deg 0*deg";
 $detector{"color"}       = "ffff00";
 $detector{"type"}        = "Polycone";

 $detector{"dimensions"}  = "0*deg 360*deg 10 0.3*cm 0.3*cm 0.3*cm 0.3*cm 0.3*cm 0.3*cm 0.3*cm 0.3*cm 0.27*cm 0.2*cm 0.35*cm 0.35*cm 0.445*cm 0.445*cm 0.35*cm 0.35*cm 0.325*cm 0.325*cm 0.325*cm 0.325*cm -4.78*cm -3.53*cm -3.53*cm -2.24*cm -2.24*cm -0.19*cm -0.19*cm 1.41*cm 1.41*cm 1.48*cm";
 $detector{"material"}    = "Kapton";
 $detector{"mfield"}      = "no";
 $detector{"ncopy"}       = 1;
 $detector{"pMany"}       = 1;
 $detector{"exist"}       = 1;
 $detector{"visible"}     = 1;
 $detector{"style"}       = 0;
 $detector{"sensitivity"} = "no";
 $detector{"hit_type"}    = "";
 $detector{"identifiers"} = "";

 print_det(\%detector, $file);
}

make_TGTU();


