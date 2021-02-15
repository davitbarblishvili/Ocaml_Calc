%{ open Ast %}

%token PLUS MINUS TIMES DIVIDE EQUAL SEMICOLON EOF
%token <int> LITERAL
%token <string> VARIABLE


%left SEMICOLON
%right EQUAL
%left PLUS MINUS
%left TIMES DIVIDE

%start expr
%type <Ast.expr> expr

%%

expr:
  expr PLUS   expr    { Binop($1, Add, $3) }
| expr MINUS  expr    { Binop($1, Sub, $3) }
| expr TIMES  expr    { Binop($1, Mul, $3) }
| expr DIVIDE expr    { Binop($1, Div, $3) }
| VARIABLE            { Var($1)}
| VARIABLE EQUAL expr { Assign($1, $3)} 
| LITERAL             { Lit($1) }
| expr SEMICOLON expr { Binop($1, Seq, $3)}

