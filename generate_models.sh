#!/bin/bash

PROJECT_NAME="IngressMedals"
DATAMODEL_PATH="DataModels/IngressMedals.xcdatamodeld/IngressMedals.xcdatamodel"
OUTPUT_PATH="DataModels/ManagedObjects"

mogenerator -m "$PROJECT_NAME/$DATAMODEL_PATH" -O "$PROJECT_NAME/$OUTPUT_PATH" --swift --template-var arc=true

