Row(
children: [
const Row(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
'20',
style: TextStyle(
color: Color(0xff276487),
),
),
Text(
'o',
style: TextStyle(
color: Color(0xff276487),
fontSize: 10.0,
),
),
],
),
Container(
margin: const EdgeInsetsDirectional.symmetric(
horizontal: 3.0),
child: const Text('/')),
const Row(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
'26',
style: TextStyle(
color: Color(0xff276487),
),
),
Text(
'o',
style: TextStyle(
color: Color(0xff276487),
fontSize: 10.0,
),
),
],
),
Text(
'Feels like 30\n Fri, 02:30 am'
)
],
)

the text under Milan, italy


.then((value) {
if (pickedImage != null) {
image = File(pickedImage.path);
emit(ImagePickerSuccessState(image: image!));
}
else {
emit(ImagePickerCanceledState());
}
})

imagePicker.pickImage(source: ImageSource.camera).then(
(pickedImage) {
if (pickedImage != null) {
image = File(pickedImage.path);
// Emit a new state to notify listeners about the image change
emit(ImagePickerSuccessState(image: image));
} else {
// Handle the case where the user canceled the image picking
emit(ImagePickerCanceledState());
}
},
)