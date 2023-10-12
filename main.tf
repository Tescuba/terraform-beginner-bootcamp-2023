terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  #backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "Exmpro0923"

  #  workspaces {
  #    name = "terra-house-1"
  #  }
  #}
  cloud {
    organization = "Exmpro0923"
    workspaces {
      name = "terra-house-1"
    }
  }

}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}

module "home_arcanum_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.arcanum.public_path
  content_version = var.arcanum.content_version
}

resource "terratowns_home" "home_arcanum" {
  name = "The untouched diving paradise of the Eritrean Red Sea!"
  description = <<DESCRIPTION
The Eritrean marine resources are vastly distributed within the long coast and 
below the beautifully and carefully preserved sea. As a continuation to the first 
part of Eritrea’s marine resources, this section gives details about the coral reefs, 
bird life, sea turtles, vegetation, tourism prospects and more.

Marine experts say that coral reefs are shallow tropical water ecosystems largely
restricted to areas between 30°N and 30°S latitudes. Coral reefs rank among the most
biologically productive and diverse of all natural ecosystems. Living coral reefs support
thousands of species including crustaceans, fishes, sponges, algae and molluscs. 
For centuries coral reefs have formed a vital component of coastal economies in many tropical countries.
DESCRIPTION
  domain_name = module.home_arcanum_hosting.domain_name
  town = "the-nomad-pad"
  content_version = var.arcanum.content_version
}

module "home_payday_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.payday.public_path
  content_version = var.payday.content_version
}

resource "terratowns_home" "home_payday" {
  name = "Eritrea’s Red Sea: Worth Exploring, Worth Investing In."
  description = <<DESCRIPTION
There are more than 600 fish species found in the Eritrean Red Sea. 
The commercially important ones can be categorized into five groups. 
These are Demersal Pelagic, Ornamental, Crustacean, and Cephalopods. 
Based on this classification, there are 104 Demersal, 79 Ornamental, 
26 Pelagic, 2 Crustacean, and 2 Cephalopod species both for local and 
export market utilization
DESCRIPTION
  domain_name = module.home_payday_hosting.domain_name
  town = "the-nomad-pad"
  content_version = var.payday.content_version
}