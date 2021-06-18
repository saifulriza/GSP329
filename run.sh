export PROJECT=$(gcloud config get-value project)
export BUCKET_NAME=$PROJECT
export PROJECT_NAME=$PROJECT
# export DATASET_NAME=image_classification_dataset

bash create_credential.sh

export GOOGLE_APPLICATION_CREDENTIALS=key.json

gsutil cp gs://$BUCKET_NAME/analyze-images.py .

cat script.py > analyze-images.py

python3 analyze-images.py $PROJECT_NAME $BUCKET_NAME