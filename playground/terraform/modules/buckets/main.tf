
#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#

resource "google_storage_bucket" "examples_bucket" {
  name          = "${var.examples_bucket_name}"
  location      = "${var.examples_bucket_location}"
  project       = "${var.project_id}"
  storage_class = "${var.examples_storage_class}"
  uniform_bucket_level_access = true
}

resource "google_storage_bucket_access_control" "public_rule" {
  bucket = google_storage_bucket.examples_bucket.name
  role   = "VIEWER"
  entity = "allUsers"
}

resource "google_storage_bucket" "terraform_bucket" {
  name          = "${var.terraform_bucket_name}"
  location      = "${var.terraform_bucket_location}"
  project       = "${var.project_id}"
  storage_class = "${var.terraform_storage_class}"
}
