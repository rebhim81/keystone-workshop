#
#  Do not edit this file.  This file is generated from 
#  package.bld.  Any modifications to this file will be 
#  overwritten whenever makefiles are re-generated.
#

unexport MAKEFILE_LIST
MK_NOGENDEPS := $(filter clean,$(MAKECMDGOALS))
override PKGDIR = xconfig_srio_fft
XDCINCS = -I. -I$(strip $(subst ;, -I,$(subst $(space),\$(space),$(XPKGPATH))))
XDCCFGDIR = package/cfg/

#
# The following dependencies ensure package.mak is rebuilt
# in the event that some included BOM script changes.
#
ifneq (clean,$(MAKECMDGOALS))
C:/ti/xdctools_3_22_04_46/include/utils.tci:
package.mak: C:/ti/xdctools_3_22_04_46/include/utils.tci
C:/ti/xdctools_3_22_04_46/packages/xdc/xdc.tci:
package.mak: C:/ti/xdctools_3_22_04_46/packages/xdc/xdc.tci
C:/ti/xdctools_3_22_04_46/packages/xdc/template.xs:
package.mak: C:/ti/xdctools_3_22_04_46/packages/xdc/template.xs
C:/ti/xdctools_3_22_04_46/packages/xdc/om2.xs:
package.mak: C:/ti/xdctools_3_22_04_46/packages/xdc/om2.xs
C:/ti/xdctools_3_22_04_46/packages/xdc/xmlgen.xs:
package.mak: C:/ti/xdctools_3_22_04_46/packages/xdc/xmlgen.xs
C:/ti/xdctools_3_22_04_46/packages/xdc/xmlgen2.xs:
package.mak: C:/ti/xdctools_3_22_04_46/packages/xdc/xmlgen2.xs
C:/ti/xdctools_3_22_04_46/packages/xdc/IPackage.xs:
package.mak: C:/ti/xdctools_3_22_04_46/packages/xdc/IPackage.xs
C:/ti/xdctools_3_22_04_46/packages/xdc/package.xs:
package.mak: C:/ti/xdctools_3_22_04_46/packages/xdc/package.xs
C:/ti/xdctools_3_22_04_46/packages/xdc/services/global/Clock.xs:
package.mak: C:/ti/xdctools_3_22_04_46/packages/xdc/services/global/Clock.xs
C:/ti/xdctools_3_22_04_46/packages/xdc/services/global/Trace.xs:
package.mak: C:/ti/xdctools_3_22_04_46/packages/xdc/services/global/Trace.xs
C:/ti/xdctools_3_22_04_46/packages/xdc/bld/bld.js:
package.mak: C:/ti/xdctools_3_22_04_46/packages/xdc/bld/bld.js
C:/ti/xdctools_3_22_04_46/packages/xdc/bld/BuildEnvironment.xs:
package.mak: C:/ti/xdctools_3_22_04_46/packages/xdc/bld/BuildEnvironment.xs
C:/ti/xdctools_3_22_04_46/packages/xdc/bld/PackageContents.xs:
package.mak: C:/ti/xdctools_3_22_04_46/packages/xdc/bld/PackageContents.xs
C:/ti/xdctools_3_22_04_46/packages/xdc/bld/_gen.xs:
package.mak: C:/ti/xdctools_3_22_04_46/packages/xdc/bld/_gen.xs
C:/ti/xdctools_3_22_04_46/packages/xdc/bld/Library.xs:
package.mak: C:/ti/xdctools_3_22_04_46/packages/xdc/bld/Library.xs
C:/ti/xdctools_3_22_04_46/packages/xdc/bld/Executable.xs:
package.mak: C:/ti/xdctools_3_22_04_46/packages/xdc/bld/Executable.xs
C:/ti/xdctools_3_22_04_46/packages/xdc/bld/Repository.xs:
package.mak: C:/ti/xdctools_3_22_04_46/packages/xdc/bld/Repository.xs
C:/ti/xdctools_3_22_04_46/packages/xdc/bld/Configuration.xs:
package.mak: C:/ti/xdctools_3_22_04_46/packages/xdc/bld/Configuration.xs
C:/ti/xdctools_3_22_04_46/packages/xdc/bld/Script.xs:
package.mak: C:/ti/xdctools_3_22_04_46/packages/xdc/bld/Script.xs
C:/ti/xdctools_3_22_04_46/packages/xdc/bld/Manifest.xs:
package.mak: C:/ti/xdctools_3_22_04_46/packages/xdc/bld/Manifest.xs
C:/ti/xdctools_3_22_04_46/packages/xdc/bld/Utils.xs:
package.mak: C:/ti/xdctools_3_22_04_46/packages/xdc/bld/Utils.xs
C:/ti/xdctools_3_22_04_46/packages/xdc/bld/ITarget.xs:
package.mak: C:/ti/xdctools_3_22_04_46/packages/xdc/bld/ITarget.xs
C:/ti/xdctools_3_22_04_46/packages/xdc/bld/ITarget2.xs:
package.mak: C:/ti/xdctools_3_22_04_46/packages/xdc/bld/ITarget2.xs
C:/ti/xdctools_3_22_04_46/packages/xdc/bld/ITargetFilter.xs:
package.mak: C:/ti/xdctools_3_22_04_46/packages/xdc/bld/ITargetFilter.xs
C:/ti/xdctools_3_22_04_46/packages/xdc/bld/package.xs:
package.mak: C:/ti/xdctools_3_22_04_46/packages/xdc/bld/package.xs
package.mak: config.bld
C:/dev/example_apps/SrioFFT/.config/xconfig_SRIOMulticore6/config.bld:
package.mak: C:/dev/example_apps/SrioFFT/.config/xconfig_SRIOMulticore6/config.bld
C:/ti/xdctools_3_22_04_46/packages/ti/targets/ITarget.xs:
package.mak: C:/ti/xdctools_3_22_04_46/packages/ti/targets/ITarget.xs
C:/ti/xdctools_3_22_04_46/packages/ti/targets/C28_large.xs:
package.mak: C:/ti/xdctools_3_22_04_46/packages/ti/targets/C28_large.xs
C:/ti/xdctools_3_22_04_46/packages/ti/targets/C28_float.xs:
package.mak: C:/ti/xdctools_3_22_04_46/packages/ti/targets/C28_float.xs
C:/ti/xdctools_3_22_04_46/packages/ti/targets/package.xs:
package.mak: C:/ti/xdctools_3_22_04_46/packages/ti/targets/package.xs
C:/ti/xdctools_3_22_04_46/packages/ti/targets/elf/ITarget.xs:
package.mak: C:/ti/xdctools_3_22_04_46/packages/ti/targets/elf/ITarget.xs
C:/ti/xdctools_3_22_04_46/packages/ti/targets/elf/TMS470.xs:
package.mak: C:/ti/xdctools_3_22_04_46/packages/ti/targets/elf/TMS470.xs
C:/ti/xdctools_3_22_04_46/packages/ti/targets/elf/package.xs:
package.mak: C:/ti/xdctools_3_22_04_46/packages/ti/targets/elf/package.xs
package.mak: package.bld
C:/ti/xdctools_3_22_04_46/packages/xdc/tools/configuro/template/compiler.opt.xdt:
package.mak: C:/ti/xdctools_3_22_04_46/packages/xdc/tools/configuro/template/compiler.opt.xdt
C:/ti/xdctools_3_22_04_46/packages/xdc/services/io/File.xs:
package.mak: C:/ti/xdctools_3_22_04_46/packages/xdc/services/io/File.xs
C:/ti/xdctools_3_22_04_46/packages/xdc/services/io/package.xs:
package.mak: C:/ti/xdctools_3_22_04_46/packages/xdc/services/io/package.xs
C:/ti/xdctools_3_22_04_46/packages/xdc/tools/configuro/template/custom.mak.exe.xdt:
package.mak: C:/ti/xdctools_3_22_04_46/packages/xdc/tools/configuro/template/custom.mak.exe.xdt
C:/ti/xdctools_3_22_04_46/packages/xdc/tools/configuro/template/package.xs.xdt:
package.mak: C:/ti/xdctools_3_22_04_46/packages/xdc/tools/configuro/template/package.xs.xdt
endif

ti.targets.elf.C66.rootDir ?= C:/ti/ccsv5/tools/compiler/c6000
ti.targets.elf.packageBase ?= C:/ti/xdctools_3_22_04_46/packages/ti/targets/elf/
.PRECIOUS: $(XDCCFGDIR)/%.oe66
.PHONY: all,e66 .dlls,e66 .executables,e66 test,e66
all,e66: .executables,e66
.executables,e66: .libraries,e66
.executables,e66: .dlls,e66
.dlls,e66: .libraries,e66
.libraries,e66: .interfaces
	@$(RM) $@
	@$(TOUCH) "$@"

.help::
	@$(ECHO) xdc test,e66
	@$(ECHO) xdc .executables,e66
	@$(ECHO) xdc .libraries,e66
	@$(ECHO) xdc .dlls,e66


all: .executables 
.executables: .libraries .dlls
.libraries: .interfaces

PKGCFGS := $(wildcard package.xs) package/build.cfg
.interfaces: package/package.xdc.inc package/package.defs.h package.xdc $(PKGCFGS)

-include package/package.xdc.dep
package/%.xdc.inc package/%_xconfig_srio_fft.c package/%.defs.h: %.xdc $(PKGCFGS)
	@$(MSG) generating interfaces for package xconfig_srio_fft" (because $@ is older than $(firstword $?))" ...
	$(XSRUN) -f xdc/services/intern/cmd/build.xs $(MK_IDLOPTS) -m package/package.xdc.dep -i package/package.xdc.inc package.xdc

.dlls,e66 .dlls: srio_fft.pe66

-include package/cfg/srio_fft_pe66.mak
ifeq (,$(MK_NOGENDEPS))
-include package/cfg/srio_fft_pe66.dep
endif
srio_fft.pe66: package/cfg/srio_fft_pe66.xdl
	@


ifeq (,$(wildcard .libraries,e66))
srio_fft.pe66 package/cfg/srio_fft_pe66.c: .libraries,e66
endif

package/cfg/srio_fft_pe66.c package/cfg/srio_fft_pe66.h package/cfg/srio_fft_pe66.xdl: override _PROG_NAME := srio_fft.xe66
package/cfg/srio_fft_pe66.c: package/cfg/srio_fft_pe66.cfg

clean:: clean,e66
	-$(RM) package/cfg/srio_fft_pe66.cfg
	-$(RM) package/cfg/srio_fft_pe66.dep
	-$(RM) package/cfg/srio_fft_pe66.c
	-$(RM) package/cfg/srio_fft_pe66.xdc.inc

clean,e66::
	-$(RM) srio_fft.pe66
.executables,e66 .executables: srio_fft.xe66

-include package/cfg/srio_fft.xe66.mak
srio_fft.xe66: package/cfg/srio_fft_pe66.oe66 
	$(RM) $@
	@$(MSG) lnke66 $@ ...
	$(RM) $(XDCCFGDIR)/$@.map
	$(ti.targets.elf.C66.rootDir)/bin/lnk6x -q -u _c_int00 -fs $(XDCCFGDIR)$(dir $@).  -q -o $@ package/cfg/srio_fft_pe66.oe66   package/cfg/srio_fft_pe66.xdl --abi=eabi -c -m $(XDCCFGDIR)/$@.map -l $(ti.targets.elf.C66.rootDir)/lib/rts6600_elf.lib
	
srio_fft.xe66:C_DIR=
srio_fft.xe66: PATH:=$(ti.targets.elf.C66.rootDir)/bin/;$(PATH)
srio_fft.xe66: Path:=$(ti.targets.elf.C66.rootDir)/bin/;$(PATH)

srio_fft.test test,e66 test: srio_fft.xe66.test

srio_fft.xe66.test:: srio_fft.xe66
ifeq (,$(_TESTLEVEL))
	@$(MAKE) -R -r --no-print-directory -f $(XDCROOT)/packages/xdc/bld/xdc.mak _TESTLEVEL=1 srio_fft.xe66.test
else
	@$(MSG) running $<  ...
	$(call EXEC.srio_fft.xe66, ) 
endif

clean,e66::
	-$(RM) .tmp,srio_fft.xe66,0,*


clean:: clean,e66

clean,e66::
	-$(RM) srio_fft.xe66
clean:: 
	-$(RM) package/cfg/srio_fft_pe66.pjt
%,copy:
	@$(if $<,,$(MSG) don\'t know how to build $*; exit 1)
	@$(MSG) cp $< $@
	$(RM) $@
	$(CP) $< $@
srio_fft_pe66.oe66,copy : package/cfg/srio_fft_pe66.oe66
srio_fft_pe66.se66,copy : package/cfg/srio_fft_pe66.se66

$(XDCCFGDIR)%.c $(XDCCFGDIR)%.h $(XDCCFGDIR)%.xdl: $(XDCCFGDIR)%.cfg .interfaces $(XDCROOT)/packages/xdc/cfg/Main.xs
	@$(MSG) "configuring $(_PROG_NAME) from $< ..."
	$(CONFIG) $(_PROG_XSOPTS) xdc.cfg $(_PROG_NAME) $(XDCCFGDIR)$*.cfg $(XDCCFGDIR)$*

.PHONY: release,xconfig_srio_fft
xconfig_srio_fft.tar: package/package.bld.xml
xconfig_srio_fft.tar: package/package.ext.xml
xconfig_srio_fft.tar: package/package.rel.dot
xconfig_srio_fft.tar: package/build.cfg
xconfig_srio_fft.tar: package/package.xdc.inc
ifeq (,$(MK_NOGENDEPS))
-include package/rel/xconfig_srio_fft.tar.dep
endif
package/rel/xconfig_srio_fft/xconfig_srio_fft/package/package.rel.xml:

xconfig_srio_fft.tar: package/rel/xconfig_srio_fft.xdc.inc package/rel/xconfig_srio_fft/xconfig_srio_fft/package/package.rel.xml
	@$(MSG) making release file $@ "(because of $(firstword $?))" ...
	-$(RM) $@
	$(call MKRELTAR,package/rel/xconfig_srio_fft.xdc.inc,package/rel/xconfig_srio_fft.tar.dep)


release release,xconfig_srio_fft: all xconfig_srio_fft.tar
clean:: .clean
	-$(RM) xconfig_srio_fft.tar
	-$(RM) package/rel/xconfig_srio_fft.xdc.inc
	-$(RM) package/rel/xconfig_srio_fft.tar.dep

clean:: .clean
	-$(RM) .libraries .libraries,*
clean:: 
	-$(RM) .dlls .dlls,*
#
# The following clean rule removes user specified
# generated files or directories.
#

ifneq (clean,$(MAKECMDGOALS))
ifeq (,$(wildcard package))
    $(shell $(MKDIR) package)
endif
ifeq (,$(wildcard package/cfg))
    $(shell $(MKDIR) package/cfg)
endif
ifeq (,$(wildcard package/lib))
    $(shell $(MKDIR) package/lib)
endif
ifeq (,$(wildcard package/rel))
    $(shell $(MKDIR) package/rel)
endif
ifeq (,$(wildcard package/internal))
    $(shell $(MKDIR) package/internal)
endif
ifeq (,$(wildcard package/external))
    $(shell $(MKDIR) package/external)
endif
endif
clean::
	-$(RMDIR) package

include custom.mak
clean:: 
	-$(RM) package/xconfig_srio_fft.pjt
