import boto3
from botocore.client import Config

# MinIO connection details
MINIO_ENDPOINT = "http://localhost:9010"
ACCESS_KEY = "shopsyncadmin"
SECRET_KEY = "ShopSync@123"
BUCKET_NAME = "shop-sync-files"

# Local file to upload
LOCAL_FILE = "sample/shop-sync-sample.txt"
OBJECT_NAME = "shop-sync-sample.txt"

# Connect to MinIO
s3 = boto3.client(
    "s3",
    endpoint_url=MINIO_ENDPOINT,
    aws_access_key_id=ACCESS_KEY,
    aws_secret_access_key=SECRET_KEY,
    config=Config(signature_version="s3v4"),
    region_name="us-east-1"
)

print("Connected to MinIO successfully!")

# 1. Upload file
print("\nUploading file...")
s3.upload_file(
    LOCAL_FILE,
    BUCKET_NAME,
    OBJECT_NAME
)
print(f"Uploaded: {OBJECT_NAME}")

# 2. List objects
print("\nObjects in bucket:")
response = s3.list_objects_v2(Bucket=BUCKET_NAME)

for obj in response.get("Contents", []):
    print(f"- {obj['Key']} ({obj['Size']} bytes)")

# 3. Read file from MinIO
print("\nReading file from MinIO...")

response = s3.get_object(
    Bucket=BUCKET_NAME,
    Key=OBJECT_NAME
)

content = response["Body"].read().decode("utf-8")

print("\nFile content:")
print(content)

print("\nMinIO upload, listing, and read operations completed successfully!")