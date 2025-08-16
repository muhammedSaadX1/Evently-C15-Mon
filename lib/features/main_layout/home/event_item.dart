import 'package:evently_c15_mon/core/assets_manager.dart';
import 'package:evently_c15_mon/core/colors_manager.dart';
import 'package:evently_c15_mon/core/extensions/date_extension.dart';
import 'package:evently_c15_mon/firebase_service/firebase_service.dart';
import 'package:evently_c15_mon/models/event_model.dart';
import 'package:evently_c15_mon/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EventItem extends StatefulWidget {
  const EventItem({super.key, required this.event , required this.isFav});
  final EventModel event;
  final bool isFav ;

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {

  late bool isFavEvent = widget.isFav;
  @override
  Widget build(BuildContext context) {

    return Container(

      margin: REdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: REdgeInsets.all(8),

      decoration: BoxDecoration(
        border: Border.all(color: ColorsManager.blue, width: 1),
        borderRadius: BorderRadius.circular(16.r),
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(ImageAssets.meeting))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Padding(
              padding: REdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
              child: Column(
                children: [
                  Text(widget.event.dateTime.day.toString(), style: GoogleFonts.inter(fontSize: 20.sp, fontWeight: FontWeight.bold, color: ColorsManager.blue
                  ),),
                  Text(widget.event.dateTime.viewMonthText, style: GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.bold, color: ColorsManager.blue
                  ),),

                ],
              ),
            ),
          ),

          SizedBox(height: 120.h),
          Card(

            child: Padding(
              padding:  REdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(child: Text(widget.event.title, style: Theme.of(context).textTheme.bodySmall,)),

                 IconButton(onPressed: _marEventAsFav, icon:  Icon( isFavEvent ? Icons.favorite : Icons.favorite_border, color: ColorsManager.blue,))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _marEventAsFav() async{
    isFavEvent = !isFavEvent;

    if(isFavEvent){
      await FirebaseService.addEventToFav(UserModel.currentUser!.id, widget.event);

    }else{
     await FirebaseService.removeEventFromFav(UserModel.currentUser!.id, widget.event);
    }
    setState(() {

    });
  }
}
