class ForgeCreate < Formula
  desc "Tool to create and save Foundry deployments"
  homepage "https://github.com/nksazonov/forge-create"
  url "https://github.com/nksazonov/forge-create/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "fb3c1e02eb216dfde1c2b3b42dab60a824ad7167e6456da77ed23ef9b88a0923"
  license "MIT"

  depends_on "foundry"
  depends_on "jq"

  def install
    libexec.install Dir["*.sh"]

    (bin/"forge-create").write <<~EOS
      #!/usr/bin/env bash
      exec "#{libexec}/forge-create.sh" "$@"
    EOS
    chmod 0755, bin/"forge-create"

    prefix.install_metafiles
  end

  test do
    assert_match "v0.1.0", shell_output("bin/forge-create --version")
  end
end
