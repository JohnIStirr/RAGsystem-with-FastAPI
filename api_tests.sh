# Write your code here
#!/bin/bash

echo "Testing the root endpoint..."
curl http://127.0.0.1:8000/

echo "Testing file upload..."
curl -X POST \
"http://127.0.0.1:8000/uploadfile/" -H "accept: application/json" \
-H "Content-Type: multipart/form-data" \
-F 'file=@/usercode/obama.txt'
echo ""
echo ""

# Testing the root endpoint
echo "Testing the root endpoint..."
curl -X 'GET' 'http://127.0.0.1:8000/' -H 'accept: application/json'
echo ""
echo ""

# Wait for 30 seconds before testing question answering
echo "Waiting for 30 seconds before testing question answering..."
sleep 30

# Testing question answering
echo "Testing question answering..."
curl -X POST \
"http://127.0.0.1:8000/ask/" \
-H "Content-Type: application/json" \
-H "Accept: application/json" \
-d '{"document_id": 1, "question": "When was Barack Obama elected for the second time ?"}'
echo ""
echo ""

# Testing similar chunk retrieval
echo "Testing similar chunk retrieval..."
curl -X POST \
"http://127.0.0.1:8000/find-similar-chunks/1" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer YOUR_TOKEN_HERE" \
-d '{"text": "example query"}'
echo ""
echo ""


  