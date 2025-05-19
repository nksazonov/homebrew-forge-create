class ForgeCreate < Formula
  desc "Tool to create and save Foundry deployments"
  homepage "https://github.com/nksazonov/homebrew-forge-create"
  url "https://github.com/nksazonov/homebrew-forge-create.git", 
      tag: "v0.1.0",
      revision: "08b4374"
  license "MIT"
  
  depends_on "jq"
  depends_on "foundry"
  
  def install
    bin.install "forge-create.sh" => "forge-create"
    bin.install "forge-create-create.sh"
    bin.install "forge-create-save.sh"
  end
  
  test do
    system "#{bin}/forge-create", "--help"
  end
end