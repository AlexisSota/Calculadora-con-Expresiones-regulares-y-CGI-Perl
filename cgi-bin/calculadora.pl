use strict;
use warnings;
use CGI qw(:standard);

print header('text/html');

my $q = CGI->new;
my $expresion = $q->param('expresion');

my $resultado = eval $expresion;

print $q->start_html('Resultado');
print $q->h1('Resultado de la expresión');
print $q->p("La expresión: $expresion");
print $q->p("El resultado: $resultado");
print $q->end_html;
