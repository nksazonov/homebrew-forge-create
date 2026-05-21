class ForgeCreate < Formula
  desc "Tool to create and save Foundry deployments"
  homepage "https://github.com/nksazonov/forge-create"
  url "https://github.com/nksazonov/forge-create/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "afe0880de1a2ab6dc5aa69f745dd5decb3ac490e409b1df425bcc06bd38a7b1a"
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
    assert_match "v0.3.1", shell_output("bin/forge-create --version")
  end
end
