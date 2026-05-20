import os
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'recruitment_system.settings')
django.setup()

from interviews.models import InterviewRound

def run_seed():
    data = [
        (202, 102, 'Technical', '2025-06-03', 30, 'FAIL'),
        (203, 103, 'Technical', '2025-06-04', 88, 'PASS'),
        (203, 103, 'Manager', '2025-06-10', 85, 'PASS'),
        (203, 101, 'HR', '2025-06-15', 80, 'PASS'),
        (204, 103, 'Technical', '2025-06-04', 90, 'PASS'),
        (204, 105, 'Manager', '2025-06-11', 72, 'PASS'),
        (204, 101, 'HR', '2025-06-18', 75, 'PASS'),
        (205, 101, 'Technical', '2025-06-05', 45, 'FAIL'),
        (206, 103, 'Technical', '2025-06-06', 92, 'PASS'),
        (206, 104, 'Manager', '2025-06-12', 48, 'FAIL'),
        (207, 102, 'Technical', '2025-06-07', 85, 'PASS'),
        (207, 102, 'Manager', '2025-06-13', 83, 'PASS'),
        (207, 101, 'HR', '2025-06-20', 85, 'PASS'),
        (209, 103, 'Technical', '2025-06-09', 95, 'PASS'),
        (209, 103, 'Manager', '2025-06-15', 91, 'PASS'),
        (209, 101, 'HR', '2025-06-22', 90, 'PASS'),
        (211, 109, 'Technical', '2025-06-12', 88, 'PASS'),
        (211, 105, 'Manager', '2025-06-18', 82, 'PASS'),
        (211, 101, 'HR', '2025-06-25', 78, 'PASS'),
        (214, 103, 'Technical', '2025-06-14', 80, 'PASS'),
        (214, 107, 'Manager', '2025-06-21', 78, 'PASS'),
        (214, 101, 'HR', '2025-06-28', 82, 'PASS'),
        (217, 107, 'Technical', '2025-06-16', 95, 'PASS'),
        (217, 111, 'Manager', '2025-06-22', 90, 'PASS'),
        (217, 101, 'HR', '2025-06-30', 88, 'PASS'),
        (218, 112, 'Technical', '2025-06-17', 77, 'PASS'),
        (218, 104, 'Manager', '2025-06-24', 76, 'PASS'),
        (218, 101, 'HR', '2025-07-02', 70, 'PASS'),
        (219, 109, 'Technical', '2025-06-18', 94, 'PASS'),
        (219, 105, 'Manager', '2025-06-25', 88, 'PASS'),
        (219, 101, 'HR', '2025-07-03', 85, 'PASS'),
        (220, 102, 'Technical', '2025-06-19', 70, 'PASS'),
        (220, 110, 'Manager', '2025-06-26', 85, 'PASS'),
        (220, 101, 'HR', '2025-07-04', 80, 'PASS'),
        (222, 111, 'Technical', '2025-06-20', 88, 'PASS'),
        (222, 107, 'Manager', '2025-06-27', 85, 'PASS'),
        (222, 101, 'HR', '2025-07-05', 82, 'PASS'),
        (223, 101, 'Technical', '2025-06-21', 81, 'PASS'),
        (223, 109, 'Manager', '2025-06-28', 76, 'PASS'),
        (223, 101, 'HR', '2025-07-06', 74, 'PASS'),
        (224, 110, 'Technical', '2025-06-22', 89, 'PASS'),
        (224, 102, 'Manager', '2025-06-29', 84, 'PASS'),
        (224, 101, 'HR', '2025-07-07', 89, 'PASS'),
        (227, 105, 'Technical', '2025-06-24', 79, 'PASS'),
        (227, 109, 'Manager', '2025-07-01', 81, 'PASS'),
        (227, 101, 'HR', '2025-07-08', 77, 'PASS'),
        (228, 106, 'Technical', '2025-06-25', 92, 'PASS'),
        (228, 110, 'Manager', '2025-07-02', 88, 'PASS'),
        (228, 101, 'HR', '2025-07-09', 91, 'PASS'),
        (229, 107, 'Technical', '2025-06-26', 89, 'PASS'),
        (229, 111, 'Manager', '2025-07-03', 81, 'PASS'),
        (229, 101, 'HR', '2025-07-10', 83, 'PASS'),
        (232, 102, 'Technical', '2025-06-27', 85, 'PASS'),
        (232, 110, 'Manager', '2025-07-04', 82, 'PASS'),
        (232, 101, 'HR', '2025-07-12', 88, 'PASS'),
        (233, 107, 'Technical', '2025-06-28', 90, 'PASS'),
        (233, 111, 'Manager', '2025-07-05', 86, 'PASS'),
        (233, 101, 'HR', '2025-07-13', 82, 'PASS'),
        (234, 112, 'Technical', '2025-06-29', 72, 'PASS'),
        (234, 104, 'Manager', '2025-07-06', 75, 'PASS'),
        (234, 101, 'HR', '2025-07-14', 80, 'PASS'),
        (235, 109, 'Technical', '2025-06-30', 88, 'PASS'),
        (235, 105, 'Manager', '2025-07-07', 84, 'PASS'),
        (235, 101, 'HR', '2025-07-15', 85, 'PASS'),
        (236, 101, 'Technical', '2025-06-05', 40, 'FAIL'),
        (237, 102, 'Technical', '2025-06-06', 35, 'FAIL'),
        (238, 103, 'Technical', '2025-06-10', 42, 'FAIL'),
        (239, 112, 'Technical', '2025-06-12', 25, 'FAIL'),
        (240, 101, 'Technical', '2025-06-15', 75, 'PASS'),
        (240, 105, 'Manager', '2025-06-20', 45, 'FAIL'),
        (241, 106, 'Technical', '2025-06-16', 82, 'PASS'),
        (241, 104, 'Manager', '2025-06-22', 50, 'FAIL'),
        (242, 107, 'Technical', '2025-06-18', 78, 'PASS'),
        (242, 111, 'Manager', '2025-06-25', 38, 'FAIL'),
        (243, 109, 'Technical', '2025-06-20', 88, 'PASS'),
        (243, 105, 'Manager', '2025-06-28', 82, 'PASS'),
        (243, 101, 'HR', '2025-07-05', 40, 'FAIL'),
        (244, 101, 'Technical', '2025-06-21', 81, 'PASS'),
        (244, 109, 'Manager', '2025-07-02', 76, 'PASS'),
        (244, 101, 'HR', '2025-07-10', 45, 'FAIL'),
        (245, 110, 'Technical', '2025-06-22', 89, 'PASS'),
        (245, 102, 'Manager', '2025-07-05', 84, 'PASS'),
        (245, 101, 'HR', '2025-07-12', 30, 'FAIL'),
        (201, 108, 'Technical', '2025-06-25', 91, 'FAIL'),
        (210, 112, 'Technical', '2025-07-01', 33, 'PASS'),
        (210, 108, 'Manager', '2025-07-07', 25, 'PASS'),
        (210, 102, 'HR', '2025-07-12', 98, 'FAIL'),
        (225, 104, 'Technical', '2025-06-20', 85, 'PASS'),
        (225, 103, 'Manager', '2025-06-27', 92, 'FAIL')
    ]

    print(f"Importing {len(data)} records...")
    
    for row in data:
        InterviewRound.objects.create(
            candidate_id=row[0],
            interviewer_id=row[1],
            round_name=row[2],
            interview_date=row[3],
            score=row[4],
            decision=row[5]
        )
    print("Data successfully imported to MySQL/SQLite!")

if __name__ == '__main__':
    run_seed()