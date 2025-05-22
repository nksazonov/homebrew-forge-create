class ForgeCreate < Formula
  desc "Tool to create and save Foundry deployments"
  homepage "https://github.com/nksazonov/forge-create"
  url "https://github.com/nksazonov/forge-create/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "5e47fb38ab48b676fd706ac9c8ca79b5539a9f1ba37b202ba8f97b3e0ea6e72e"
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
    assert_match "v0.1.2", shell_output("bin/forge-create --version")
  end
end
