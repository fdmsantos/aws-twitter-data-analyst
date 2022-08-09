variable "name_prefix" {
  type    = string
  default = "twitter-nba"
}

variable "s3_force_destroy" {
  type    = bool
  default = false
}

### Flags ###
variable "enable_data_collection" {
  type        = bool
  default     = true
  description = "Set it to false to disable process related with data collection (Kinesis Firehose)"
}

variable "enable_data_catalog" {
  type        = bool
  default     = true
  description = "Set it to false to disable process related with data catalog (Glue Catalog & Glue Crawler)"
}

variable "enable_etl" {
  type        = bool
  default     = true
  description = "Set it to false to disable process related with etl (Glue Job)"
}

variable "enable_emr" {
  type        = bool
  default     = true
  description = "Set it to false to disable emr cluster"
}

### EMR ###
variable "emr_vpc_id" {
  type = string
}

variable "emr_subnet_id" {
  type = string
}

variable "key_pair_name" {
  type = string
}

### Glue ###
variable "glue_jobs_bookmark" {
  type    = string
  default = "job-bookmark-disable"
  validation {
    condition     = contains(["job-bookmark-enable", "job-bookmark-disable", "job-bookmark-pause"], var.glue_jobs_bookmark)
    error_message = "Valid values for var: glue_jobs_bookmark are (job-bookmark-enable, job-bookmark-disable, job-bookmark-pause)."
  }
}

variable "glue_crawl_recrawl_behavior" {
  type    = string
  default = "CRAWL_EVERYTHING"
  validation {
    condition     = contains(["CRAWL_EVENT_MODE", "CRAWL_EVERYTHING", "CRAWL_NEW_FOLDERS_ONLY"], var.glue_crawl_recrawl_behavior)
    error_message = "Valid values for var: glue_crawl_recrawl_behavior are (CRAWL_EVENT_MODE, CRAWL_EVERYTHING, CRAWL_NEW_FOLDERS_ONLY)."
  }
}