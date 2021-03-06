$: << File.dirname(__FILE__)
require 'bitescript/asm'
require 'bitescript/signature'
require 'bitescript/bytecode'
require 'bitescript/builder'
require 'bitescript/mirror'

module BiteScript
  include BiteScript::ASM
  JAVA1_4 = Opcodes::V1_4
  JAVA1_5 = Opcodes::V1_5
  JAVA1_6 = Opcodes::V1_6
  JAVA1_7 = Opcodes::V1_7

  class << self
    attr_accessor :bytecode_version

    # Default to JVM version we're running on
    spec_version = ENV_JAVA['java.specification.version']
    BiteScript.bytecode_version = BiteScript.const_get("JAVA#{spec_version.gsub('.', '_')}")
  end
end
