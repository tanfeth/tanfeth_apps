
import 'package:flutter/material.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/sizes.dart';

void modifyBottomSheet(context, Function onEdit, Function onDelete) {
  showModalBottomSheet(
      context: context,
      elevation: 0,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) {
        return ModifyBottomSheetContent(onEdit, onDelete);
      });
}

class ModifyBottomSheetContent extends StatelessWidget {
  final Function onEdit;
  final Function onDelete;

  const ModifyBottomSheetContent(this.onEdit, this.onDelete, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MySizes.buttonHeight * 3,
      margin: EdgeInsets.all(MySizes.defaultPadding),
      child: Center(
        child: ClipRRect(
          borderRadius:
              BorderRadius.all(Radius.circular(MySizes.defaultPadding)),
          child: Container(
            height: double.infinity,
            color: Theme.of(context).colorScheme.surface,
            padding: EdgeInsets.all(MySizes.defaultPadding),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        // Navigator.push(
                        //     context,
                        //     PageTransition(
                        //         type: PageTransitionType.fade,
                        //         duration: Duration(
                        //             milliseconds:
                        //                 Res.duration.pageForward),
                        //         child: EditPost(
                        //             fkPost: postModel!.id!,
                        //             fkGroup: postModel.Fk_Group,
                        //             isPostComments:
                        //                 widget.isPostComments)));
                        onEdit.call();
                      },
                      child: modifyBottomSheetRow(
                          context, Icons.edit_rounded, LangEnum.edit.tr())),
                  Divider(),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        onDelete.call();
                        // PostEditModel model = PostEditModel(
                        //     widget.postModel.id!,
                        //     false,
                        //     widget.postModel.PostText!,
                        //     widget.postModel.PostSpecializations!
                        //         .map((e) => e.id!)
                        //         .toList(),
                        //     widget.postModel.PostDepartments!
                        //         .map((e) => e.id!)
                        //         .toList(),
                        //     widget.postModel.PostGovernorates!
                        //         .map((e) => e.id!)
                        //         .toList(),
                        //     widget.postModel.PostMedicalFacilityTypes!
                        //         .map((e) => e.id!)
                        //         .toList(),
                        //     widget.postModel.PostWorkGroups!
                        //         .map((e) => e.id!)
                        //         .toList());
                        //
                        // var postProvider = Provider.of<PostProvider>(
                        //     context,
                        //     listen: false);
                        // postProvider.loading = true;
                        // postProvider.editPost(context, model);
                        // Navigator.pop(context);
                      },
                      child: modifyBottomSheetRow(
                          context, Icons.delete, LangEnum.delete.tr()))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget modifyBottomSheetRow(context, IconData imageLocation, String? title) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(imageLocation,
              color: Theme.of(context).colorScheme.onSurface,
              size: MySizes.defaultPadding * 2.5),
          SizedBox(width: MySizes.defaultPadding),
          Text(title!,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.subtitle1),
        ],
      ),
    );
  }
}
