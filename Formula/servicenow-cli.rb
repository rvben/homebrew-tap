class ServicenowCli < Formula
  desc "Manage ServiceNow records and workflows"
  homepage "https://github.com/rvben/servicenow-cli"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/servicenow-cli/releases/download/v0.6.0/servicenow-cli-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "29010693d17ed963aa17e1c72d7b61b043a868e88517531c62b6846376349dd2"
    else
      url "https://github.com/rvben/servicenow-cli/releases/download/v0.6.0/servicenow-cli-v0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "5a0a6907dd1bc435ccf10ac0cb159fa900d7dc6c455e4cb4e7a7e96999bd9d0a"
    end
  end

  on_linux do
    depends_on "rust" => :build

    on_arm do
      url "https://static.crates.io/crates/servicenow-cli/servicenow-cli-0.6.0.crate"
      sha256 "de386169be4ebd1fa6bec1b37752c75766d15564fbc4d6098c866e7f6f767780"
    end
    on_intel do
      url "https://static.crates.io/crates/servicenow-cli/servicenow-cli-0.6.0.crate"
      sha256 "de386169be4ebd1fa6bec1b37752c75766d15564fbc4d6098c866e7f6f767780"
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
