if [[ -z "$ENV" ]]; then
    echo "Must provide TYPE in environment variables" 1>&2
    exit 1
fi

terraform init \
    -backend-config="bucket=tfvino" \
    -backend-config="key=SERVER/${ENV}"