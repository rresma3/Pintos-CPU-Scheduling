BUILD_SUBDIRS = threads userprog vm filesys

all::
	@echo "Run 'make' in subdirectories: $(BUILD_SUBDIRS)."
	@echo "This top-level make has only 'clean' targets."

CLEAN_SUBDIRS = $(BUILD_SUBDIRS) examples utils

clean::
	for d in $(CLEAN_SUBDIRS); do $(MAKE) -C $$d $@; done
	rm -f TAGS tags

distclean:: clean
	find . -name '*~' -exec rm '{}' \;

TAGS_SUBDIRS = $(BUILD_SUBDIRS) devices lib
TAGS_SOURCES = find $(TAGS_SUBDIRS) -name \*.[chS] -print

TAGS::
	etags --members `$(TAGS_SOURCES)`

tags::
	ctags -T --no-warn `$(TAGS_SOURCES)`

cscope.files::
	$(TAGS_SOURCES) > cscope.files

cscope:: cscope.files
	cscope -b -q -k

##################
# Handin your work
##################
turnin.tar: clean
	tar cvf turnin.tar `find . -type f | grep -v \.tar$$ | grep -v \.tar\.gz$$ | grep -v /\.git | grep -v \.swp$$ | grep -v CVS | grep -v svn | grep -v \.pl$$ | grep -v ~$$` 

LAB1_NAME := threads
LAB2_NAME := user
LAB3_NAME := vm
LAB4_NAME := filesys

turnin_threads: turnin.tar
	mv turnin.tar threads_turnin.tar
	gzip threads_turnin.tar
	@echo "Created threads_turnin.tar.gz for submission.  Please upload to Canvas."
	@echo "Before uploading, please verify:"
	@echo "         Your README.threads is correctly filled out."
	@echo "         Your programming_log.threads reflects your programming work on this project."
	@echo "If either of those items are not done, please update your submission and run the make turnin command again.  We also recommend you review the Turnin Checklist, which is linked from the main project page." 

turnin_user: turnin.tar
	mv turnin.tar userprog_turnin.tar
	gzip userprog_turnin.tar
	@echo "Created userprog_turnin.tar.gz for submission.  Please upload to Canvas."
	@echo "Before uploading, please verify:"
	@echo "         Your README.userprog is correctly filled out."
	@echo "         Your programming_log.userprog reflects your programming work on this project."
	@echo "         Your pair programming log is in the userprog directory."
	@echo "If either of those items are not done, please update your submission and run the make turnin command again.  We also recommend you review the Turnin Checklist, which is linked from the main project page." 

turnin_vm: turnin.tar
	mv turnin.tar vm_turnin.tar
	gzip vm_turnin.tar
	@echo "Created vm_turnin.tar.gz for submission.  Please upload to Canvas."
	@echo "Before uploading, please verify:"
	@echo "         Your README.vm is correctly filled out."
	@echo "         Your programming_log.vm reflects your programming work on this project."
	@echo "If either of those items are not done, please update your submission and run the make turnin command again.  We also recommend you review the Turnin Checklist, which is linked from the main project page." 

turnin_fs: turnin.tar
	mv turnin.tar filesys_turnin.tar
	gzip filesys_turnin.tar
	@echo "Created filesys_turnin.tar.gz for submission.  Please upload to Canvas."
	@echo "Before uploading, please verify:"
	@echo "         Your README.filesys is correctly filled out."
	@echo "         Your programming_log.filesys reflects your programming work on this project."
	@echo "If either of those items are not done, please update your submission and run the make turnin command again.  We also recommend you review the Turnin Checklist, which is linked from the main project page." 
