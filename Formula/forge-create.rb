class ForgeCreate < Formula
  desc "Tool to create and save Foundry deployments"
  homepage "https://github.com/nksazonov/forge-create"
  url "https://github.com/nksazonov/forge-create/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "a3b0ba34fa3739008a3ce2db88e9bd218ff871330fed3d878a2b464d04df847d"
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
    assert_match "v0.1.1", shell_output("bin/forge-create --version")
  end
end
