# Como rodar

1. Instale o [terraform](https://developer.hashicorp.com/terraform/install)

2. Instale [kubectl](https://kubernetes.io/docs/tasks/tools/) caso ainda não tenha instalado

3. Execute `terraform init` para baixar os providers necessários

4. Procure em values.yaml a sessão externalS3 e preencha com as informações de sua conta na [Magalu Cloud](https://console.magalu.cloud/).

As informações necessárias são:
host: Endpoint do object storage do magalu - "(br-se1 ou br-ne1).magaluobjects.com"

accessKey e secretKey: Chaves de acessos do object storage, [clique aqui](https://docs.magalu.cloud/docs/devops-tools/api-keys/how-to/object-storage/create-api-keys) para saber como obtelas.

bucketName: nome do bucket a ser criado para armazenar os dados do Milvus.

5. Execute `terraform apply`.

6. Após finalizar a execução do 5 passo, execute `kubectl --kubeconfig=kubeconfig.yaml get pods` e verifique se todos os pods estão com status de running ou complete.