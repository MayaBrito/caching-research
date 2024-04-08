# Item Repetition Ratio

Esse script pode ser usado para obter a porcentagem de requisições repetidas a determinado tenant (IRR) ou porcentagem de requisições repetidas global (IRR Global). É considerado que o dado esteja em formato `csv`.

## Script irr.go

### Formato de entrada do dado 

O dado utilizado pelo script tem as seguintes colunas:
- tenant: identificador único do tenant
- object: identificador único do objeto
- ts: timestamp

### Formato de saída do dado

O dado resultante possui as seguintes colunas caso seja calculado por tenant:
- tenant: identificador único do tenant
- IRR: porcentagem de requisições repetidas do tenant

O dado resultante possui as seguintes colunas caso seja calculado global:
- IRR: porcentagem de requisições repetidas por todos os tenants

### Como executar

`sh irr.sh workload.csv`

## Script irr.py

### Formato de entrada do dado 
O dado utilizado pelo script tem uma única coluna:
- object: identificador único do objeto

### Formato de saída do dado
O dado resultante no terminal:
- IRR: porcentagem de requisições repetidas do tenant

### Como executar

`python3 irr.py < workload.csv`