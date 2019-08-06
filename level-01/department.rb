class Department
	attr_accessor :department_name, :sections, :studentnamelistA, :studentrolllistA, :studentnamelistB, :studentrolllistB, :studentnamelistC, :studentrolllistC
	def initialize(name)
		self.department_name=name;
		self.sections={'A'=>10,'B'=>10,'C'=>10}
		self.studentnamelistA=[];
		self.studentnamelistB=[];
		self.studentnamelistC=[];
		self.studentrolllistA=[];
		self.studentrolllistB=[];
		self.studentrolllistC=[];
	end
	def get_depart
		self.department_name
	end
	def add_details(student_name,rollnumber)
		if rollnumber[-3]=='A'
			self.studentnamelistA<<student_name;
			self.studentrolllistA<<rollnumber;
		end
		if rollnumber[-3]=='B'
			self.studentnamelistB<<student_name;
			self.studentrolllistB<<rollnumber;
		end
		if rollnumber[-3]=='C'
			self.studentnamelistC<<student_name;
			self.studentrolllistC<<rollnumber;
		end
	end
	def find_seat(section)
		return self.sections[section]
	end
	def put_department_detail
		if self.sections['A']==10 && self.sections['B']==10 && sections['C']==10
			puts "No student is admitted to this department so far..!\n"
		else
			x=0
			while x<(10-self.sections['A'])
			puts "#{studentnamelistA[x]}-#{studentrolllistA[x]}"
			x=x+1
			end
			x=0
			while x<(10-self.sections['B'])
			puts "#{studentnamelistB[x]}-#{studentrolllistB[x]}"
			x=x+1
			end
			x=0
			while x<(10-self.sections['C'])
			puts "#{studentnamelistC[x]}-#{studentrolllistC[x]}"
			x=x+1
			end
		end
	end
	def add_roll_newsection(name,section)
		x=10-self.sections[section]+1;
		self.sections[section]=sections[section]-1;
		if x==10
			new_roll=self.get_depart+section+x.to_s;
		else
			new_roll=self.get_depart+section+'0'+x.to_s;
		end
	end
	def show_students_specific_section(section)
		if section=='A'
			if self.sections['A']==10
				puts "\nThere is no student in #{section} section"
			else
				x=0
				while x<(10-self.sections['A'])
				puts "#{studentnamelistA[x]}-#{studentrolllistA[x]}"
				x=x+1
				end
			end
		else
			if section=='B'
				if self.sections['B']==10
				puts "\nThere is no student in #{section} section"
				else
					x=0
					while x<(10-self.sections['B'])
					puts "#{studentnamelistB[x]}-#{studentrolllistB[x]}"
					x=x+1
					end
				end
			else
				if section=='C'
					if self.sections['C']==10
						puts "\nThere is no student in #{section} section"
					else
						x=0
						while x<(10-self.sections['C'])
						puts "#{studentnamelistC[x]}-#{studentrolllistC[x]}"
						x=x+1
						end
					end
				else
					puts "There is no section like #{section} in #{self.get_depart}"
				end
			end
		end
	end
	def find_section(name)
		x=self.studentnamelistA.find_index(name)
		if x!=nil
			return self.studentrolllistA[x];
		else
			x=self.studentnamelistB.find_index(name)
			if x!=nil
				return self.studentrolllistB[x];
			else
				x=self.studentnamelistC.find_index(name)
				if x!=nil
					return self.studentrolllistC[x]
				else
					return nil;
				end
			end
		end
	end
	def remove_roll(old_name)
		x=self.studentnamelistA.find_index(old_name)
		if x!=nil
			self.studentnamelistA.delete_at(x)
			old_rollno=self.studentrolllistA[x]
			self.studentrolllistA.delete_at(x)
			m=1;
			self.studentrolllistA.each do |a|
				d=a;
				if d[-2]==1
					d[-2]=0
					d[-1]=m.to_s
					m=m+1
					a.replace(d)
				else
					d[-1]=m.to_s;
					m=m+1;
					a.replace(d)
				end
			end 
			self.sections['A']=self.sections['A']+1
		else
			x=self.studentnamelistB.find_index(old_name)
			if x!=nil 
				self.studentnamelistB.delete_at(x)
				old_rollno=self.studentrolllistB[x]
				self.studentrolllistB.delete_at(x)
				m=1;
				self.studentrolllistB.each do |a|
					d=a
					if d[-2]==1
						d[-2]=0
						d[-1]=m.to_s
						m=m+1
						a.replace(d)
					else
						d[-1]=m.to_s;
						m=m+1;
						a.replace(d)
					end
				end
				self.sections['B']=self.sections['B']+1 
			else
				x=self.studentnamelistC.find_index(old_name)
				if x!=nil
					self.studentrolllistC.delete_at(x)
					old_rollno=self.studentrolllistC[x]
					self.studentrolllistC.delete_at(x)
					m=1;
					self.studentrolllistC.each do |a|
						dd=a
						if d[-2]==1
							d[-2]=0
							d[-1]=m.to_s
							m=m+1
							a.replace(d)
						else
							d[-1]=m.to_s;
							m=m+1;
							a.replace(d)
						end
					end
					self.sections['C']=self.sections['C']+1
				end
			end
		end
	end
	def get_section
		if self.sections['A']>=1
			r=10-self.sections['A']+1;
			if r<10
				sect='A0'+r.to_s;
				self.sections['A']-=1;
				return sect;
			else
				sect='A'+r.to_s;
				self.sections['A']-=1;
				return sect;
			end
		else
			if self.sections['B']>=1
				r=10-self.sections['B']+1;
				if r<10
					sect='B0'+r.to_s;
					self.sections['B']-=1;
					return sect;
				else
					sect='B'+r.to_s;
					self.sections['B']-=1;
					return sect;
				end
			else
				if self.sections['C']>=1
					r=10-self.sections['C']+1;
					if r<10
						sect='C0'+r.to_s;
						self.sections['C']-=1;
						return sect;
					else
						sect='C'+r.to_s;
						self.sections['C']-=1;
						return sect;
					end
				else
					return 0;
				end
			end
		end

	end
end
