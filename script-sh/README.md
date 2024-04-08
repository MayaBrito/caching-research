# Scripts para a coleta e análise de dados

## trace-collector.sh

### Configuração inicial

- DATASET_URL="https://example.com/data" | Url para buscar os traces
- BUCKET_NAME="bucket-name" | Nome para o bucket onde será armazenado
- DATA_NAME="data-name" | Nome para os traces que serão armazenados

### Como executar

`./trace-collector.sh`

## trace-metrics.sh

### Configuração inicial

- tmp_working_dir=tmp_working_dir | Diretório onde ficará os traces filtrados
- output_dir=output | Diretório para armazenar os arquivos das métricas
- irr_dir=$output_dir/irr | Diretório para armazenar arquivos com as métricas de IRR
- footprint_dir=$output_dir/footprint | Diretório para armazenar arquivos com as métricas de Footprint
- input_dir=/home/ubuntu | Diretório onde o arquivo do trace está armazenado

## Formato de saída

Os dados resultantes estarão associados as pastas de acordo com os diretórios configurados

### Como executar

`./trace-metrics.sh`