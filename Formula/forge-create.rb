class ForgeCreate < Formula
  desc "Tool to create and save Foundry deployments"
  homepage "https://github.com/nksazonov/forge-create"
  url "https://github.com/nksazonov/forge-create/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "d4ca39ad1b3382fa93798d04172558aededf52699ed13dcbb2aace6ec45a44a5"
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
    assert_match "v0.2.0", shell_output("bin/forge-create --version")
  end
end
