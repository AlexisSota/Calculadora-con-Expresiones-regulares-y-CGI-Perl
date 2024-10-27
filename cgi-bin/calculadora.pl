#!/usr/bin/perl
use strict;
use warnings;
use CGI ':standard';

print header();
print start_html(-title => 'Lab 05 - Calculator', -style => { -src => '/css/style.css' });

my $expression = param('expression') // '';
my $result = '';

if ($expression) {
    # Evaluar expresión usando una regex básica para operaciones aritméticas
    if ($expression =~ /^[\d\+\-\*\/\(\)\.\s]+$/) {
        $result = eval($expression);
        $result = defined $result ? sprintf("%.2f", $result) : "Error";
    } else {
        $result = "Invalid expression";
    }
}

# HTML de la calculadora
print qq(
    <div class="container">
        <h2>Lab 05: Expresiones regulares en Perl</h2>
        <form method="get" action="/cgi-bin/calculadora.pl">
            <textarea name="expression" rows="2" cols="30" placeholder="(5+15)/(2*2)">$expression</textarea><br>
            <input type="submit" value="Calculate" class="btn">
        </form>
        <div class="result">
            <strong>Result:</strong> <span class="output">$result</span>
        </div>
        <footer>Pw1 - 24b Grupo D (Copyright &copy; 2024 - Hecho por Alexis)</footer>
    </div>
);

print end_html;
