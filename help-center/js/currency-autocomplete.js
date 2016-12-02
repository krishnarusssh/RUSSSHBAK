$(function(){
  var currencies = [
    { value: 'What are the operational hours?', data: 'Russsh operates from 7am to 10pm from Mon-Sat and from 9am-6pm on Sundays. Russsh operates 365 days a year.' },
    { value: 'Can I place an order after operational hours? What if I place an order?', data: 'If you place an order after operational hours you will not receive a confirmation in 20 minutes. Instead a confirmation will be sent the following day after 7am.' },
    { value: 'Where can Russsh deliver my parcel?', data: 'Russsh delivers in Mumbai, Thane and Navi Mumbai. There may be additional delivery charges if you want to send a parcel or pickup one from places like Virar, Kalyan and Panvel. Please call our customer service dept on +91-8080808315 or live chat on our website www.russsh.com.' },
    { value: 'How much time does a single pick up and delivery take?', data: 'On average a single pickup and drop may take 2-4 hours from the time a pickup has been done. If you want a pick and delivery to be done under 2 hours you can choose our EXPRESS delivery service.' },
    { value: 'What are the delivery charges?', data: 'Please visit our pricing page for charges.' },
    { value: 'How do I place an order?', data: 'To place an order online, visit & follow instructions.<br>To place an order on the phone, call +91-8080808315' },
    { value: 'How do I know if Russsh has received my order?', data: 'When we receive your order we will send a confirmation by email and sms on your registered email address and mobile number in 20 minutes from the time we receive your order.' },
    { value: 'What if my parcel is lost or damaged during delivery by Russsh?', data: 'We take complete responsibility for all the products handled by our team hence any loss or damaged while doing a delivery will be covered by us.' },
    { value: 'How does cash delivery work?', data: 'Russsh will charge a flat 2% cash handling fees for any kind of cash delivery.' },
    { value: 'Does russsh do midnight deliveries?', data: 'Yes, we do midnight deliveries. Please call our customer service for information on midnight deliveries +91-8080808315.' },
    { value: 'Do you deliver outside Mumbai? What are the charges', data: 'Yes. These are the places we deliver to outside Mumbai (Bhayander to Virar, Thane to Kalyan and Belapur to Panvel) For charges visit pricing page.' },
    { value: 'What if I cannot find the item I want to deliver in the list?', data: 'If the item you want to send is not there in the list please choose Other, well add this item to the list in the future.' },
    { value: 'Why should I add an instruction. What should I write here?', data: 'If you add an instruction here it will help us understand your request and act on it more efficiently. Heres an example of an instruction Michelle wants to send a Bow-tie to a friend as a gift. So she chooses gift as the item to be delivered. In the instructions she mentions that the delivery shouldnt be later than 10pm as the receiver wouldnt be available. She also wants to ensure we do not mention to the receiver that it was her who sent the gift.' },
    { value: 'Why should I mention the value of the item?', data: 'Mentioning an approximate value of the item helps us ensure your item is safe at all times during a delivery. It also helps us identify the safest mode of transport.In case if your parcel is lost or damaged during transit we will only be liable to refund the value mentioned at the time of booking a task.' },
    { value: 'What if I dont know the value of my item that I want to deliver?', data: 'Please choose the closest approximate value in case you are not sure above the correct value.' },
    { value: 'Why should I choose the weight of the item?', data: 'All items up to 5kg can be delivered within the service cost. If your item exceeds 5kg there will be an extra charge of Rs.100 for every additional 5kgs. For e.g. if your item weighs 7kg, you will have to pay an extra Rs.100 and if your item weighs 12 kg you will have to pay Rs.200 extra.' },
    { value: 'What if I do not know the weight of the item?', data: 'Our delivery executive always carries a weighing scale, on pick up your item will be weighed and this will be informed to you.' },
    { value: 'When should I choose a one way delivery', data: 'You should choose a one way delivery when you want Russsh to pickup an item from point a and deliver it to point b.' },
    { value: 'When should I choose a return delivery?', data: 'You should choose a return delivery when you want Russsh to pickup an item from point a and deliver it to point b, then you want another item or cash to be picked from point b and delivered back to point a.' },
    { value: 'How do I make a payment?', data: 'You can pay in these ways: <br> (1) Cash at the pickup or delivery point.<br> (2) Using credit/debit card (3)  Pay using an e-wallet. For more information on e-wallet download this manual for information' },
    { value: 'What should I do if my item is lost or damaged during transit?', data: 'If your item gets damaged or is lost during transit we will reimburse you for the damage.' },
    { value: 'What if I keep the delivery executive waiting at the pickup or delivery point?', data: 'If you keep our delivery executive waiting at either pickup and/or delivery point you will have to pay an additional waiting charge of Rs.100 for every 30 minutes. Please note our delivery executive will wait for 15 minutes at the pickup or delivery point for which you will not be charged.' },
    { value: 'What if Russsh is late for pickup or delivery?', data: 'Please call our customer service on +91-8080808315 to check with our team. It almost never happens that our delivery executives are late and we have not informed you.' },
    { value: 'What is the cancellation charge?', data: 'If a task is not cancelled 2 hours prior the pickup time, cancellation fees of Rs 100/- will be applicable' },
    { value: 'What if I want to cancel my order?', data: 'You can cancel your order anytime, but a cancellation fee will be charged if the order is cancelled 2 hours prior your pickup time. ' },
    { value: 'What if I havent received a confirmation from Russsh about my delivery?', data: 'Please call our customer care on +91-8080808315 or live chat on our site www.russsh.com. You can also inbox us on our facebook page (https://www.facebook.com/Getmypeon) or direct message us on Twitter (https://www.twitter.com/russsh_in)' },
    { value: 'When should I choose an express delivery?', data: 'You should an express delivery when you want us to pickup and deliver an item within 2 hours. ' },
    { value: 'When should I choose single pickup and multiple delivery?', data: 'You should choose single pickup and multiple delivery when you want Russsh to pickup lots of items from point a and deliver it to point b, c,d,e,f and more.' },
  ];
  
  // setup autocomplete function pulling from currencies[] array
  $('#autocomplete').autocomplete({
    lookup: currencies,
    onSelect: function (suggestion) {
        var thehtml = '<strong>Question:</strong> ' + suggestion.value + ' <br> <strong>Answer:</strong> ' + suggestion.data;
        fnshow();
      $('#outputcontent').html(thehtml);
       
       
    }
  });
  

});