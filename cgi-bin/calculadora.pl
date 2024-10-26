#!/usr/bin/perl

use strict;
use warnings;
use CGI qw(:standard);
use POSIX qw(floor);

print header();
print start_html('Calculadora CGI-Perl');

my $expresion = param('expresion');
my $resultado;

if ($expresion) {
  
    $resultado = evalExpression($expresion);
}

print "<h2>Resultado:</h2>";
print "<p>$resultado</p>" if defined $resultado;

print end_html();

sub evalExpression {
    my ($exp) = @_;

    $exp =~ s/\^/**/g;

    if ($exp =~ /^[\d+\-*/(). ]+$/) {
        my $result = eval $exp;
        if ($@) {
            return "Error en la expresión: $@";
        }
        return $result;
    } else {
        return "Expresión no válida.";
    }
}
