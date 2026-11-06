class ServicenowCli < Formula
  desc "Manage ServiceNow records and workflows"
  homepage "https://github.com/rvben/servicenow-cli"
  version "0.6.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/servicenow-cli/releases/download/v0.6.3/servicenow-cli-v0.6.3-aarch64-apple-darwin.tar.gz"
      sha256 "929c27189e435ed731c14c8d3a18a476b75d6aae2be8ac711221d88b3c81f9af"
    else
      url "https://github.com/rvben/servicenow-cli/releases/download/v0.6.3/servicenow-cli-v0.6.3-x86_64-apple-darwin.tar.gz"
      sha256 "0d4b983057831d35401a90a943cce2ccc4c5e325bdce208f90f8f3fa183090bc"
    end
  end

  on_linux do
    depends_on "rust" => :build

    on_arm do
      url "https://static.crates.io/crates/servicenow-cli/servicenow-cli-0.6.3.crate"
      sha256 "6b5e5c04eb1f1f317745f9cd72e942505ce5c1377c73cc3e41298b4d61f702a7"
    end
    on_intel do
      url "https://static.crates.io/crates/servicenow-cli/servicenow-cli-0.6.3.crate"
      sha256 "6b5e5c04eb1f1f317745f9cd72e942505ce5c1377c73cc3e41298b4d61f702a7"
    end
  end

  def install
    if OS.linux?
      system "cargo", "install", *std_cargo_args, "--bin", "servicenow"
    else
      bin.install "servicenow"
    end
    bin.install_symlink "servicenow" => "servicenow-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/servicenow --version")
    assert_match version.to_s, shell_output("#{bin}/servicenow-cli --version")
    assert_match "Usage:", shell_output("#{bin}/servicenow --help")
  end
end
