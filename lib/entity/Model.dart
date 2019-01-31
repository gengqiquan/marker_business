class Model<T> {
	T data;
	String info;
	int status;

	Model({this.data, this.info, this.status});

	Model.fromJson(Map<String, dynamic> json) {
		data = json['data'];
		info = json['info'];
		status = json['status'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['data'] = this.data;
		data['info'] = this.info;
		data['status'] = this.status;
		return data;
	}
}
