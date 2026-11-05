class ServicenowCli < Formula
  desc "Manage ServiceNow records and workflows"
  homepage "https://github.com/rvben/servicenow-cli"
  version "0.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/servicenow-cli/releases/download/v0.6.1/servicenow-cli-v0.6.1-aarch64-apple-darwin.tar.gz"
      sha256 "b64de7e075e51877e69ebbb4e3de9ab914a1a3bd3da693c17f6ee505914134f8"
    else
      url "https://github.com/rvben/servicenow-cli/releases/download/v0.6.1/servicenow-cli-v0.6.1-x86_64-apple-darwin.tar.gz"
      sha256 "2e1fbc126acf0ba17d50eace7e485ed6ce704639ff505634410168646dc0d7b5"
    end
  end

  on_linux do
    depends_on "rust" => :build

    on_arm do
      url "https://static.crates.io/crates/servicenow-cli/servicenow-cli-0.6.1.crate"
      sha256 "a20542347b86e2380fba281769a8e3413a45fbdbc40aa2f4d73a38f96703c2fd"
    end
    on_intel do
      url "https://static.crates.io/crates/servicenow-cli/servicenow-cli-0.6.1.crate"
      sha256 "a20542347b86e2380fba281769a8e3413a45fbdbc40aa2f4d73a38f96703c2fd"
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
